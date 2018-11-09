//
//  ZMTextInput+Extension.swift
//  ZMTextInputDemo
//
//  Created by zhangshumeng on 2018/11/9.
//  Copyright © 2018 zhangshumeng. All rights reserved.
//

import Foundation

extension String {
    
    /// 移除emoji
    func text_removeEmoji() -> String {
        let pattern = "[^\\u0020-\\u007E\\u00A0-\\u00BE\\u2E80-\\uA4CF\\uF900-\\uFAFF\\uFE30-\\uFE4F\\uFF00-\\uFFEF\\u0080-\\u009F\\u2000-\\u201f\r\n]"
        return self.text_pregReplace(pattern: pattern, with: "")
    }
    
    /// 返回字数
    var text_count: Int {
        let string_NS = self as NSString
        return string_NS.length
    }
    
    /// 使用正则表达式替换
    func text_pregReplace(pattern: String, with: String,
                          options: NSRegularExpression.Options = []) -> String {
        let regex = try! NSRegularExpression(pattern: pattern, options: options)
        return regex.stringByReplacingMatches(in: self, options: [],
                                              range: NSMakeRange(0, self.text_count),
                                              withTemplate: with)
    }
}
