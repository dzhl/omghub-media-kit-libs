#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint media_kit_libs_ios_video.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  system("cd \"#{__dir__}\" && make") || abort("Make failed!")
  frameworks = Dir.glob('Frameworks/*.xcframework')
  if frameworks.empty?
    dir_content = `cd \"#{__dir__}\" && ls -la Frameworks/`
    abort("=== 终极大雷达 ===\nGlob 抓取为空！\n当前 Frameworks 目录的实际内容是:\n#{dir_content}\n==================")
  end
  s.name             = 'media_kit_libs_ios_video'
  s.version          = '1.1.5'
  s.summary          = 'iOS dependency package for package:media_kit'
  s.description      = <<-DESC
  iOS dependency package for package:media_kit.
                       DESC
  s.homepage         = 'https://github.com/media-kit/media-kit.git'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Hitesh Kumar Saini' => 'saini123hitesh@gmail.com' }

  s.source           = { :path => '.' }
  s.source_files     = 'media_kit_libs_ios_video/Sources/media_kit_libs_ios_video/**/*.swift'
  s.dependency 'Flutter'
  s.resource_bundles = {
    'media_kit_libs_ios_video_privacy' => ['media_kit_libs_ios_video/Sources/media_kit_libs_ios_video/PrivacyInfo.xcprivacy']
  }

  s.vendored_frameworks = 'Frameworks/*.xcframework'

  s.platform = :ios, '9.0'
  s.pod_target_xcconfig = {
    'DEFINES_MODULE' => 'YES',
    # Flutter.framework does not contain a i386 slice.
    'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386',
  }
  s.swift_version = '5.0'
end
