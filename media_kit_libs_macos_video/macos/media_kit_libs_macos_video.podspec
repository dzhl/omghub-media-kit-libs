#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint media_kit_libs_macos_video.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  system("cd \"#{__dir__}\" && make") || abort("Make failed!")
  frameworks = Dir.glob('Frameworks/*.xcframework')
  if frameworks.empty?
    dir_content = `cd \"#{__dir__}\" && ls -la Frameworks/`
    abort("=== 终极大雷达 ===\nGlob 抓取为空！\n当前 Frameworks 目录的实际内容是:\n#{dir_content}\n==================")
  end

  s.name             = 'media_kit_libs_macos_video'
  s.version          = '1.1.5'
  s.summary          = 'macOS dependency package for package:media_kit'
  s.description      = <<-DESC
  macOS dependency package for package:media_kit.
                       DESC
  s.homepage         = 'https://github.com/media-kit/media-kit.git'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Hitesh Kumar Saini' => 'saini123hitesh@gmail.com' }

  s.source           = { :path => '.' }
  s.source_files     = 'media_kit_libs_macos_video/Sources/media_kit_libs_macos_video/**/*.swift'
  s.dependency 'FlutterMacOS'
  s.resource_bundles = {
    'media_kit_libs_macos_video_privacy' => ['media_kit_libs_macos_video/Sources/media_kit_libs_macos_video/PrivacyInfo.xcprivacy']
  }

  s.vendored_frameworks = 'Frameworks/*.xcframework'

  s.platform = :osx, '10.9'
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES' }
  s.swift_version = '5.0'
end
