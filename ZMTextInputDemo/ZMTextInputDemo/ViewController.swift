//
//  ViewController.swift
//  ZMTextInputDemo
//
//  Created by zhangshumeng on 2018/11/9.
//  Copyright © 2018 zhangshumeng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private lazy var textField1: ZMTextField = {
        let textField1 = ZMTextField(frame: CGRect(x: 50, y: 100, width: view.frame.size.width - 100, height: 50))
        textField1.backgroundColor = UIColor.red
        textField1.placeholder = "正常的TextField"
        return textField1
    }()
    
    private lazy var textField2: ZMTextField = {
        let textField2 = ZMTextField(frame: CGRect(x: 50, y: 160, width: view.frame.size.width - 100, height: 50))
        textField2.backgroundColor = UIColor.gray
        textField2.maxLength = 11
        textField2.isRemoveEmoji = true
        textField2.placeholder = "最大输入11位，禁止输入emoji"
        return textField2
    }()
    
    private lazy var textView: ZMTextView = {
        let textView = ZMTextView(frame: CGRect(x: 50, y: 220, width: view.frame.size.width - 100, height: 200))
        textView.backgroundColor = UIColor.gray
        textView.maxLength = 11
        textView.isRemoveEmoji = true
        textView.placeholder = "占位字符1"
        textView.placeholderColor = UIColor.red
        textView.textColor = UIColor.white
        textView.font = UIFont.systemFont(ofSize: 16)
        return textView
    }()
    
    private lazy var textView2: ZMTextView = {
        let textView = ZMTextView(frame: CGRect(x: 50, y: 430, width: view.frame.size.width - 100, height: 200))
        textView.backgroundColor = UIColor.gray
        textView.maxLength = 11
        textView.isRemoveEmoji = true
        textView.placeholder = "占位字符2"
        textView.placeholderColor = UIColor.red
        textView.placeholderFont = UIFont.systemFont(ofSize: 20)
        textView.textColor = UIColor.white
        return textView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(textField1)
        view.addSubview(textField2)
        view.addSubview(textView)
        view.addSubview(textView2)
        
        textField1.didValueChange = { textField in
            debugPrint("textField1: \(textField.text ?? "")")
        }
        
        textField1.didMaxLength = { textField in
            debugPrint("textField1 max")
        }
        
        textField2.didValueChange = { textField in
            debugPrint("textField2: \(textField.text ?? "")")
        }
        
        textField2.didMaxLength = { textField in
            debugPrint("textField2 max")
        }
        
        textView.didValueChange = { textField in
            debugPrint("textView: \(textField.text ?? "")")
        }
        
        textView.didMaxLength = { textField in
            debugPrint("textView max")
        }
        
        textView2.didValueChange = { textField in
            debugPrint("textView2: \(textField.text ?? "")")
        }
        
        textView2.didMaxLength = { textField in
            debugPrint("textView2 max")
        }
        
    }
}

