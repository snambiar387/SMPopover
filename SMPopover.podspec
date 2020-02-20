#
#  Be sure to run `pod spec lint SMPopover.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|


  s.name = 'SMPopover'
  s.version = '0.0.1'
  s.license = 'MIT'
  s.summary = 'Simple Popover for iOS'
  s.homepage = 'https://github.com/snambiar387/SMPopover'
  s.authors = { 'Sreehari' => 'snambiar387@gmail.com' }
  s.source = { :git => 'https://github.com/snambiar387/SMPopover.git', :tag => s.version }
  s.ios.deployment_target = '10.0'
  s.swift_versions = ['5.0', '5.1']
  s.source_files = 'Source/*.swift'
 
end
