#
#  Be sure to run `pod spec lint RDCore.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|


  spec.name         = "RDCore"
  spec.version      = "0.0.1"
  spec.summary      = "Core functionality to build apps"

  spec.homepage     = "https://github.com/yoanarios/RDCore"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author             = { "Yoana Rios" => "yrrios13@gmail.com" }

  spec.platform     = :ios
  spec.ios.deployment_target = "13.0"
  spec.swift_version = "5.0"

  spec.source       = { :git => "https://github.com/yoanarios/RDCore.git", :tag => "#{spec.version}" }
  spec.source_files  = "RDCore/**/*.{h,swift}"

end
