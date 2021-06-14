
# Be sure to run `pod lib lint DiyalogEngine_Pod.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'DiyalogEngine'
  s.version          = '4.4.1'
  s.summary          = 'DiyalogEngine iOS SDK for intergration DiyalogEngine Messaging to your apps.'

  s.homepage         = 'https://github.com/tcak76/DiyalogEngine'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Diyalog' => 'diyalog-im@users.noreply.github.com' }
  s.source           = { :git => 'https://github.com/tcak76/DiyalogEngine.git', :tag => s.version.to_s }
  s.public_header_files = "DiyalogEngine/DiyalogEngine.framework/Headers/*.h"
  s.source_files     = "DiyalogEngine/DiyalogEngine.framework/Headers/*.h"

  s.ios.deployment_target = '10.0'

  s.prepare_command = <<-CMD
      echo 'fetching DiyalogEngine.framework'
      curl -OL 'https://diyalog.im/app/pkgs/ios_frameworks/DiyalogEngine/4.4.1/DiyalogEngine.zip'
      rm -fr 'DiyalogEngine.framework'
      echo 'unzipping DiyalogEngine.framework'
      unzip -o -q DiyalogEngine.zip
      echo 'cleaning files'
      rm DiyalogEngine.zip
    CMD

  s.preserve_paths = 'DiyalogEngine'
  s.vendored_frameworks =  'DiyalogEngine.framework'
  
  s.xcconfig = {
     "SWIFT_INCLUDE_PATHS" => "$(PROJECT_DIR)/Pods/DiyalogEngine",
     "FRAMEWORK_SEARCH_PATHS" => "$(PROJECT_DIR)/Pods/DiyalogEngine"
  }
  
end

