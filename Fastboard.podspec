Pod::Spec.new do |s|
  s.name             = 'Fastboard'
  s.version          = '0.3.2'
  s.summary          = 'Quickly create a whiteboard interface for iOS'

  s.description      = <<-DESC
  High-level SDK for Whiteboard-iOS with UI.
  We recommend using Whiteboard-iOS directly if you need more customization,
                       DESC

  s.homepage         = 'https://github.com/netless-io/fastboard-iOS'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'yunshi' => 'xuyunshi@agora.io' }
  s.source           = { :git => 'https://github.com/netless-io/fastboard-iOS.git', :tag => s.version.to_s }

  s.swift_version = '5.0'
  s.ios.deployment_target = '10.0'
  s.source_files = 'Fastboard/Classes/**/*'
  s.resource_bundles = {
    'Icons' => ['Fastboard/Assets/*']
  }
  
  s.dependency 'Whiteboard', '~> 2.15.20'
  s.frameworks = 'UIKit'

  
end
