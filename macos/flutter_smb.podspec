Pod::Spec.new do |s|
  s.name             = 'flutter_smb'
  s.version          = '0.0.1'
  s.summary          = 'A new Flutter FFI plugin project.'
  s.description      = <<-DESC
A new Flutter FFI plugin project.
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }

  # build para a biblioteca Go
  s.source           = { :path => '.' }
  s.source_files     = 'Classes/**/*'
  s.public_header_files = 'Classes/**/*.h'
  s.dependency 'FlutterMacOS'
  s.vendored_libraries  = 'libgo.dylib'
  s.platform = :osx, '10.11'
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES' }
  s.swift_version = '5.0'
  # Script de build para a biblioteca Go
  # s.script_phase = {
  #   :name => 'Build Go Library',
  #   :script => 'cd ${SRCROOT}/../../../src && make macos',
  #   :execution_position => :before_compile
  # }
  
end
