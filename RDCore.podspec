Pod::Spec.new do |spec|

  spec.name        = 'RDCore'
  spec.version     = '0.1.0'
  spec.summary     = 'Core functios'

  spec.homepage    = 'https://github.com/yoanarios/RDCore.git'
  spec.license     = { :type => 'MIT', :file => 'LICENSE.txt' }
  spec.authors     = { 'yoanarios' => "" }

  spec.source      = { :git => "https://github.com/yoanarios/RDCore.git", :tag => "#{s.version}" }
  # spec.source_files = 'RDCore/**/*.{h,swift}'
  # spec.resources = ['RDCore/**/*.{xib,storyboard}']
  spec.swift_version = "5.0"

end