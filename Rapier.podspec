#
# Be sure to run `pod lib lint Rapier.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Rapier'
  s.version          = '0.0.1'
  s.summary          = 'A dependency injection framework for swift.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
This pods purpose is to reduce the boilerplate that comes with using dependency
injection. It generates an initializer for constructor/initializer injection
and class members from a dependencies annotation
(looks like '//sourcery:dependencies:Prot1,Prot2,...').
Additionaly you get a generated AppFactory factory class,
which has a function, that creates an object of a type implementing
the given protocol. (For that to work, there must be exactly one type implementing
that protocol, whose name does not begin with Mock.)
                       DESC

  s.homepage         = 'https://github.com/kaygro/Rapier'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'kaygro' => 'kay@dein-superheld.de' }
  s.source           = { :git => 'https://github.com/kaygro/Rapier.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'Rapier/Templates/**/*'
  
  # s.resource_bundles = {
  #   'Rapier' => ['Rapier/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.dependency 'Sourcery'
	s.ios.script_phase = {
		:name => 'Hello World',
		:script => 'echo "Hello World"',
		:execution_position => :before_compile
	}
end
