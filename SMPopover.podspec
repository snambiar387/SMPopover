Pod::Spec.new do |s|
  s.name = 'SMPopover'
  s.version = '0.0.2'
  s.license = 'MIT'
  s.summary = 'Simple Popover for iOS'
  s.homepage = 'https://github.com/snambiar387/SMPopover'
  s.authors = { 'Sreehari' => 'snambiar387@gmail.com' }
  s.source = { :git => 'https://github.com/snambiar387/SMPopover.git', :tag => s.version }
  s.ios.deployment_target = '10.0'
  s.swift_versions = ['5.0', '5.1']
  s.source_files = 'Source/*.swift'
end
