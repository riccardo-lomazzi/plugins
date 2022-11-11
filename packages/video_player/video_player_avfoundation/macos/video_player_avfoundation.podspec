#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint video_player_avfoundation.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'video_player_avfoundation'
  s.version          = '0.0.1'
  s.summary          = 'Flutter Video Player.'
  s.description      = <<-DESC
  A Flutter plugin for playing back video on a Widget surface.
  Downloaded by pub (not CocoaPods).
                       DESC
  s.homepage         = 'https://github.com/flutter/plugins'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Mitric S.R.L.' => 'info@mitric.com' }
  s.source           = { :path => '.' }
  s.documentation_url = 'https://pub.dev/packages/video_player'
  s.source_files     = 'Classes/**/*'
  s.public_header_files = 'Classes/**/*.h'
  s.dependency 'FlutterMacOS'

  s.platform = :osx, '10.11'
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES' }
  s.swift_version = '5.0'
end
