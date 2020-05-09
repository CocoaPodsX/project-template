Pod::Spec.new do |spec|
    spec.name                   = '_Template_Project0x07'
    spec.version                = '0.0.1'
    spec.license                = { :type => 'MIT', :file => 'LICENSE' }
    spec.author                 = { '_name0x07' => '_email0x07' }
    spec.summary                = 'A short description of _Template_Project0x07.'
    spec.homepage               = 'https://github.com/_name0x07/_Template_Project0x07'
    spec.source                 = { :git => 'https://github.com/_name0x07/_Template_Project0x07.git', :tag => spec.version.to_s }
    
    spec.ios.deployment_target  = '9.0'

    spec.static_framework       = true
    spec.framework              = 'Foundation'
    
    spec.source_files           = 'Sources/**/*.{h,m,swift}'
    spec.module_map             = 'Sources/_Template_Project0x07.modulemap'
    spec.public_header_files    = 'Sources/_Template_Project0x07.h'

    # spec.libraries              = 'sqlite3'
    # spec.resources              = ['Bundles/_Template_Project0x07.bundle']
    # spec.dependency 'Alamofire'
end
