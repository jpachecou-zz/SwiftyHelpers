Pod::Spec.new do |s|

  s.name         = 'SwiftyHelpers'
  s.version      = '0.1.4'
  s.summary      = 'Elegant helpers to improve the swift syntax'
  s.homepage     = 'https://github.com/jpachecou/SwiftyHelpers'
  s.license      = 'MIT'
  s.author       = { 'Jonathan Pacheco' => 'jonathan261090@gmail.com' }
  s.social_media_url   = 'http://twitter.com/jpachecou'
  s.source       = { :git => 'https://github.com/jpachecou/SwiftyHelpers.git', :tag => s.version }

  s.platform     = :ios 
  s.ios.deployment_target = '8.0'
  s.source_files  = 'Source/**/*.swift'
  s.requires_arc = true

  s.framework = "UIKit"
end
