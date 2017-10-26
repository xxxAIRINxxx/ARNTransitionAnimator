Pod::Spec.new do |s|
  s.name         = "ARNTransitionAnimator"
  s.version      = "3.0.1"
  s.summary      = "Custom transition & interactive transition animator for iOS. written in Swift."
  s.homepage     = "https://github.com/xxxAIRINxxx/ARNTransitionAnimator"
  s.license      = 'MIT'
  s.author       = { "Airin" => "xl1138@gmail.com" }
  s.source       = { :git => "https://github.com/xxxAIRINxxx/ARNTransitionAnimator.git", :tag => s.version.to_s }

  s.requires_arc = true
  s.platform     = :ios, '8.0'

  s.source_files = 'Source/*.swift'
end
