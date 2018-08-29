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
and class members from a dependencies annotation in addition to a handy factory class.
It uses sourcery for code generation and swinject to help build the object graph.
                       DESC

  s.homepage         = 'https://github.com/kaygro/Rapier'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'kaygro' => 'kay@dein-superheld.de' }
  s.source           = { :git => 'https://github.com/kaygro/Rapier.git',
												 :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

	templates = 'Rapier/Templates/*.swifttemplate'
	
	s.source_files = templates
   
	s.dependency 'Swinject'
	
	script = <<~SCRIPT
	sourcerycmd="$PODS_ROOT/Sourcery/bin/sourcery"
	$sourcerycmd --templates "$PODS_TARGET_SRCROOT/Rapier/Templates" --sources "$SRCROOT" --exclude-sources "$SRCROOT/Rapier" --exclude-sources "$SRCROOT/Example/Pods"  --output "$PODS_TARGET_SRCROOT/Generated" --verbose
	env
	SCRIPT
	
	#Currently not supported
	s.subspec 'AutoIntegrate' do |sp|
		
		sp.source_files = templates
		sp.dependency 'Sourcery'
		sp.ios.script_phase = {
			:name => 'Hello World',
			:script => script,
			:execution_position => :before_compile
		}
		
	end
	
	s.subspec 'Manual' do |sp|
		sp.source_files = templates
	end
	
	s.default_subspecs = 'Manual'
end
