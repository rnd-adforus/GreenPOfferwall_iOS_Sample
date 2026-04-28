platform :ios, '14.0'
source 'https://github.com/CocoaPods/Specs.git'

target 'GreenpOfferwallSample' do
  use_frameworks!
  pod 'GreenPOfferWall', '4.2.0' #Required
  pod 'UAdKit', '2.5.1' #Optional (Admob)
  
  pod 'UPanKit/Adapters/Admob', '1.5.1' #Optional (Pangle + Admob Adpater Pangle)
  # pod 'UPanKit', '1.5.1' #Optional (Pangle)
  pod 'CubeXKit', '1.1.0' #Optional (Adforus RTB)
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
