Pod::Spec.new do |spec|
  spec.name         = 'UIKitConfiguration'
  spec.module_name  = "UIKitConfiguration"
  spec.version      = '0.0.1'
  spec.summary      = <<-DESC
  UIKit parameter Configuration.
  DESC
  spec.description  = <<-DESC
  UIKit parameter Configuration.
  Thank you!!
  DESC
  spec.homepage     = 'https://github.com/sakiyamaK/UIKitConfiguration'
  spec.license      = { :type => 'MIT', :file => 'LICENSE' }
  spec.author       = { 'Kei Sakiyama' => 'sakiyama.k@gmail.com' }
  spec.source       = { :git => 'https://github.com/sakiyamaK/UIKitConfiguration.git', :tag => spec.version.to_s }
  spec.ios.deployment_target = '14.0'
  spec.source_files = 'Sources/UIKitConfiguration/**/*'
  spec.swift_versions = '5.9'
  spec.static_framework = true
end
