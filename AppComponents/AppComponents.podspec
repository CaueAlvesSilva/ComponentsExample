Pod::Spec.new do |spec|

  spec.name = 'AppComponents'
  spec.version = '0.1.0'
  spec.summary = 'Components to be used in the App.'
  spec.homepage = 'YourRepoHomepage'
  spec.author = { 'YourName' => "your@email.com" }
  spec.license = { :type => 'private' }
  spec.source = { :git => 'YourRepoURL', 
                  :tag => spec.version.to_s }

  spec.ios.deployment_target = '10.0'
  spec.requires_arc = true

  spec.cocoapods_version = '>= 1.5'
  spec.swift_version = '5.0'

  spec.source_files = 'AppComponents/**/*.{h,m,swift}'

  spec.resource_bundles = {
    'AppComponents' => [
      'AppComponents/**/*.xcassets',
      'AppComponents/**/*.xib'
    ]
  }

  spec.dependency 'UIView+Shimmer'

end






