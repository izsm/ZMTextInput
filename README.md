# ZMTextInput

# 介绍
1. UITextField和UITextView限制输入长度
2. UITextField和UITextView限制输入emoji表情
3. 为UITextView添加占位字符
# 安装
```
platform :ios, '9.0'
use_frameworks!

target 'YourTargetName' do
    pod 'ZMTextInput', '~> 0.1.0'
end
```
# 使用
1. ZMTextField
```
private lazy var textField: ZMTextField = {
    let textField = ZMTextField(frame: CGRect(x: 50, y: 160, width: view.frame.size.width - 100, height: 50))
    textField.backgroundColor = UIColor.gray
    textField.maxLength = 11 // 最大输入长度
    textField.isRemoveEmoji = true // 是否输入emoji，默认false（可以输入emoji）
    textField.placeholder = "最大输入11位，禁止输入emoji"
    return textField
}()

/// 文本改变回调
textField.didValueChange = { textField in
    debugPrint("textField: \(textField.text ?? "")")
}

/// 文本达到最大长度的回调
textField.didMaxLength = { textField in
    debugPrint("textField max")
}
```
2. ZMTextView
```
private lazy var textView: ZMTextView = {
    let textView = ZMTextView(frame: CGRect(x: 50, y: 220, width: view.frame.size.width - 100, height: 200))
    textView.backgroundColor = UIColor.gray
    textView.textColor = UIColor.white
    textView.maxLength = 11 // 最大输入长度
    textView.isRemoveEmoji = true // 是否输入emoji，默认false（可以输入emoji）
    textView.placeholder = "占位字符" // 占位字符
    textView.placeholderColor = UIColor.red // 占位字符颜色
    return textView
}()

/// 文本改变回调
textView.didValueChange = { textField in
    debugPrint("textField: \(textField.text ?? "")")
}

/// 文本达到最大长度的回调
textView.didMaxLength = { textField in
    debugPrint("textField max")
}
```

