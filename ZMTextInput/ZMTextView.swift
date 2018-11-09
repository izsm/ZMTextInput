//
//  ZMTextView.swift
//  YL
//
//  Created by 张书孟 on 2018/11/9.
//  Copyright © 2018 zsm. All rights reserved.
//

import UIKit

open class ZMTextView: UITextView {

    /// 是否移除emoji 默认为 false
    open var isRemoveEmoji: Bool = false
    /// 最大限制文本长度, 默认不限制长度
    open var maxLength: Int = LONG_MAX
    /// 设定文本改变回调
    open var didValueChange: (UITextView) -> Void = { _ in }
    /// 设定文本达到最大长度的回调
    open var didMaxLength: (UITextView) -> Void = { _ in }

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
        // 注销第一响应者时移除文本变化的通知, 以免影响其它的`UITextField`对象.
        NotificationCenter.default.removeObserver(self, name: UITextView.textDidChangeNotification, object: nil)
        return resign
    }
}

extension ZMTextView {
    @objc private func textViewDidChange(notification: Notification) {
        
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
