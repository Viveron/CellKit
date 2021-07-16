#
# Be sure to run `pod lib lint CellKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'CellKit'
  s.version          = '0.1.0'
  s.summary          = 'Shortcuts and helpers for working with UITableView.'

  s.description      = <<-DESC
CellKit is shortcuts and helpers for working with UITableView.
                       DESC

  s.homepage         = 'https://github.com/viveron/CellKit'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'viveron' => 'shabanov.dev.git@gmail.com' }
  s.source           = { :git => 'https://github.com/viveron/CellKit.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'

  s.swift_version = '5.0'
  s.source_files = 'CellKit/Classes/**/*'
end
