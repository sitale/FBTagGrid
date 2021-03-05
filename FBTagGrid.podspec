
#
# Be sure to run `pod lib lint Grid.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
    s.name             = 'FBTagGrid'
    s.version          = '1.0'
    s.summary          = 'A simple Grid tagView layout wrritten with SwiftUI'
  
    s.homepage         = 'https://github.com/sitale/FBTagGrid.git'
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { 'Exyte' => 'info@exyte.com' }
    s.source           = { :git => 'https://github.com/sitale/FBTagGrid.git', :tag => s.version.to_s }
    s.social_media_url = 'https://github.com/sitale/FBTagGrid.git'
  
    s.ios.deployment_target = '14.0'
    s.osx.deployment_target = "10.15"
    s.source_files = 'Shared/Sources/*.swift'
    s.swift_version = "5.3"
    
  end