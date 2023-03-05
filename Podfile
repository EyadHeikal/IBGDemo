workspace 'Demo.xcworkspace'
platform :ios, '14.6'
use_frameworks!

def common_pods
#  pod 'Instabug', :podspec => 'https://ios-releases.instabug.com/custom/save_features_on_background/Instabug.podspec'
#  pod 'Instabug', :podspec => 'https://ios-releases.instabug.com/custom/gojek/11.4.1/Instabug.podspec'
#    pod 'Instabug', :podspec => 'https://ios-releases.instabug.com/custom/customBuild-test/11.4.1/Instabug.podspec'
  pod 'Instabug'
end

target 'Demo' do
    common_pods
end

target 'SwiftDemo' do
    project 'SwiftDemo/SwiftDemo.xcodeproj'
    common_pods
end


target 'iMessageDemo' do
  project 'iMessageDemo/iMessageDemo.xcodeproj'
  common_pods
end

target 'iMessageDemo MessagesExtension' do
  project 'iMessageDemo/iMessageDemo.xcodeproj'
  common_pods
end
