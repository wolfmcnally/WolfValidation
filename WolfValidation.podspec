Pod::Spec.new do |s|
    s.name             = 'WolfValidation'
    s.version          = '1.0'
    s.summary          = 'Framework for validating user-entered data including phone numbers and email addresses.'

    s.homepage         = 'https://github.com/wolfmcnally/WolfValidation'
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { 'Wolf McNally' => 'wolf@wolfmcnally.com' }
    s.source           = { :git => 'https://github.com/wolfmcnally/WolfValidation.git', :tag => s.version.to_s }

    s.swift_version = '4.2'

    s.source_files = 'WolfValidation/Classes/**/*'

    s.ios.deployment_target = '10.0'
    s.macos.deployment_target = '10.13'
    s.tvos.deployment_target = '11.0'

    s.module_name = 'WolfValidation'

    s.dependency 'WolfLocale'
    s.dependency 'WolfStrings'
    s.dependency 'WolfConcurrency'
    s.dependency 'WolfFoundation'
end
