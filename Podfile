platform :ios, '14.0'
source 'https://github.com/CocoaPods/Specs.git'

target 'GreenpOfferwallSample' do
  use_frameworks!
  pod 'GreenPOfferWall', '3.5.2'
  pod 'UAdKit', '1.2.0' #Optional
  target 'GreenpOfferwallSampleTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'GreenpOfferwallSampleUITests' do
    # Pods for testing
  end

end

post_install do |pi|
  pi.pods_project.targets.each do |t|
    t.build_configurations.each do |config|
      config.build_settings[‘BUILD_LIBRARY_FOR_DISTRIBUTION’] = ‘YES’
    end
  end
end
