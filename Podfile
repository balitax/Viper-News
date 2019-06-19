platform :ios, '10.0'

target 'ViperNews' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for ViperNews
  
  pod 'Kingfisher'
  pod 'PKHUD'
  pod 'RxSwift'
  pod 'Alamofire'
  pod 'HGPlaceholders'
  pod 'XCDYouTubeKit'

  target 'ViperNewsTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'ViperNewsUITests' do
    inherit! :search_paths
    # Pods for testing
  end

end


post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['ENABLE_BITCODE'] = 'YES'
      config.build_settings['SWIFT_VERSION'] = '5.0'
    end
  end
end
