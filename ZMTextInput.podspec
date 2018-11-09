#
#  Be sure to run `pod spec lint ZMTextInput.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|

spec.name         = "ZMTextInput"
spec.version      = "0.0.1"
spec.license      = "MIT"
spec.summary      = "tests ZMTextInput."
spec.homepage     = "https://github.com/ZSMHup/ZMTextInput"
spec.author             = { "张书孟" => "403549384@qq.com" }
spec.source       = { :git => "https://github.com/ZSMHup/ZMTextInput.git", :tag => spec.version }
spec.ios.deployment_target = "9.0"

spec.source_files = 'ZMTextInput/*.swift'
spec.requires_arc = true
spec.swift_version = '4.2'

end
