
Pod::Spec.new do |s|
  s.name             = ‘PZBRepository’
  s.version          = ‘1.0.0’
  s.summary          = "A pretty obscure library.
                You've probably never heard of it.”

  s.homepage         = ‘https://github.com/LovingStranger/PZBRepository'

  s.license          = 'MIT'
  s.author           = { ‘LovingStranger’ => ‘’ }
  s.source           = { :git => ‘https://github.com/LovingStranger/PZBRepository.git', :tag => ‘1.0.0’ }
  # s.social_media_url = 'https://twitter.com/NAME'
  s.social_media_url = "https://twitter.com/mattt"

  s.platform     = :ios, ‘7.0’
  # s.ios.deployment_target = ‘7.0’
  # s.osx.deployment_target = '10.10’
  s.requires_arc = true

  s.source_files = 'PZBRepository'
  # s.resources = 'Assets'

  # s.ios.exclude_files = 'Classes/osx'
  # s.osx.exclude_files = 'Classes/ios'
  # s.public_header_files = 'Classes/**/*.h'
  s.frameworks = 'Foundation', 'CoreGraphics', 'UIKit'

end
