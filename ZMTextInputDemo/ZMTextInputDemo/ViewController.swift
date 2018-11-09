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
        let textField2 = ZMTextField(frame: CGRect(x: 50, y: 200, width: view.frame.size.width - 100, height: 50))
        textField2.backgroundColor = UIColor.gray
        textField2.maxLength = 11
        textField2.isRemoveEmoji = true
        textField2.placeholder = "最大输入11位，禁止输入emoji"
        return textField2
    }()
    
    private lazy var textView: ZMTextView = {
        let textView = ZMTextView(frame: CGRect(x: 50, y: 300, width: view.frame.size.width - 100, height: 200))
        textView.backgroundColor = UIColor.gray
        textView.maxLength = 11
        textView.isRemoveEmoji = true
        return textView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(textField1)
        view.addSubview(textField2)
        view.addSubview(textView)
        
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
        
    }
}

