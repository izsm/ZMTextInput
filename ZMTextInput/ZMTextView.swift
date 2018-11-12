//
//  ZMTextView.swift
//
//  Created by zhangshumeng on 2018/11/9.
//  Copyright © 2018 zhangshumeng. All rights reserved.
//

import UIKit

open class ZMTextView: UITextView {

    /// 占位文字
    open var placeholder: String = "" {
        didSet {
            setNeedsDisplay()
        }
    }
    
    /// 占位文字颜色
    open var placeholderColor: UIColor = UIColor.gray {
        didSet {
            setNeedsDisplay()
        }
    }
    
    /// 是否移除emoji 默认为 false
    open var isRemoveEmoji: Bool = false
    
    /// 最大限制文本长度, 默认不限制长度
    open var maxLength: Int = LONG_MAX
    
    /// 设定文本改变回调
    open var didValueChange: (UITextView) -> Void = { _ in }
    
    /// 设定文本达到最大长度的回调
    open var didMaxLength: (UITextView) -> Void = { _ in }

    public override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)

        // 成为第一响应者时注册通知监听文本变化
        NotificationCenter.default.addObserver(self, selector: #selector(textViewDidChange(notification:)), name: UITextView.textDidChangeNotification, object: nil)
    }
    
    open override func draw(_ rect: CGRect) {
        guard !hasText else { return }
        
        var rect = rect
        let attrs: [NSAttributedString.Key : Any] = [NSAttributedString.Key.font: font ?? UIFont.systemFont(ofSize: 12),
                     NSAttributedString.Key.foregroundColor: placeholderColor]
        rect.origin.x = 5
        rect.origin.y = 8
        rect.size.width -= 2 * rect.origin.x
        placeholder.draw(in: rect, withAttributes: attrs)
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        setNeedsDisplay()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}

extension ZMTextView {
    override open func becomeFirstResponder() -> Bool {
        let become = super.becomeFirstResponder()
        // 成为第一响应者时注册通知监听文本变化
        NotificationCenter.default.addObserver(self, selector: #selector(textViewDidChange(notification:)), name: UITextView.textDidChangeNotification, object: nil)
        
        return become
    }
    
    override open func resignFirstResponder() -> Bool {
        let resign = super.resignFirstResponder()
        // 注销第一响应者时移除文本变化的通知, 以免影响其它的`UITextView`对象.
        NotificationCenter.default.removeObserver(self, name: UITextView.textDidChangeNotification, object: nil)
        return resign
    }
}

extension ZMTextView {
    @objc private func textViewDidChange(notification: Notification) {
        // 会重新调用drawRect:方法
        setNeedsDisplay()
        guard let _ = notification.object as? ZMTextView,
            var texts = text,
            markedTextRange == nil else { return }
        // 禁止第一个字符输入空格或者换行
        if texts.count == 1, texts == " " || texts == "\n" {
            texts = ""
        }
        
        if isRemoveEmoji {
            texts = texts.text_removeEmoji()
        }
        
        if maxLength != LONG_MAX,
            texts.count > maxLength {
            didMaxLength(self)
            texts = texts.prefix(maxLength).description
        }
        text = texts
        didValueChange(self)
    }
}
