#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint media_kit_libs_ios_video.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  # ── [OMGHUB-DIAG] podspec 评估阶段日志 ──
  puts "[media_kit_libs_ios_video] ▶ podspec 正在被 CocoaPods 评估"
  puts "[media_kit_libs_ios_video] __dir__ = #{__dir__}"
  puts "[media_kit_libs_ios_video] 执行 make ..."
  make_start = Time.now
  # 确保 __dir__ 不含 CRLF 残留字符
  clean_dir = File.expand_path(__dir__).gsub(/\r/, '')
  make_ok = system("cd \"#{clean_dir}\" && make")
  make_elapsed = (Time.now - make_start).round(1)
  puts "[media_kit_libs_ios_video] make 耗时 #{make_elapsed}s，退出码: #{make_ok ? 0 : $?.exitstatus}"

  frameworks = Dir.glob(File.join(clean_dir, 'Frameworks', '*.xcframework')).map { |f| File.basename(f) }
  puts "[media_kit_libs_ios_video] Frameworks/ 内的 xcframeworks (#{frameworks.size} 个): #{frameworks.join(', ')}"

  symlink_ios = File.join(clean_dir, 'Frameworks', '.symlinks', 'mpv', 'ios')
  puts "[media_kit_libs_ios_video] .symlinks/mpv/ios 存在: #{File.exist?(symlink_ios) || Dir.exist?(symlink_ios)}"

  abort("[media_kit_libs_ios_video] ✗ make 失败，构建中止") unless make_ok
  # ── [OMGHUB-DIAG] end ──

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
