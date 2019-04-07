Pod::Spec.new do |s|
    s.name             = 'WolfValidation'
    s.version          = '3.0.0'
    s.summary          = 'Framework for validating user-entered data including phone numbers and email addresses.'

    s.homepage         = 'https://github.com/wolfmcnally/WolfValidation'
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { 'Wolf McNally' => 'wolf@wolfmcnally.com' }
    s.source           = { :git => 'https://github.com/wolfmcnally/WolfValidation.git', :tag => s.version.to_s }

    s.swift_version = '5.0'

    s.source_files = 'WolfValidation/Classes/**/*'

    s.ios.deployment_target = '12.0'
    s.macos.deployment_target = '10.14'
    s.tvos.deployment_target = '12.0'

    s.module_name = 'WolfValidation'

    s.dependency 'WolfLocale'
    s.dependency 'WolfStrings'
    s.dependency 'WolfFoundation'
    s.dependency 'WolfConcurrency'
    s.dependency 'WolfNIO'
end
