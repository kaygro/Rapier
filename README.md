# Rapier

[![CI Status](https://img.shields.io/travis/kaygro/Rapier.svg?style=flat)](https://travis-ci.org/kaygro/Rapier)
[![Version](https://img.shields.io/cocoapods/v/Rapier.svg?style=flat)](https://cocoapods.org/pods/Rapier)
[![License](https://img.shields.io/cocoapods/l/Rapier.svg?style=flat)](https://cocoapods.org/pods/Rapier)
[![Platform](https://img.shields.io/cocoapods/p/Rapier.svg?style=flat)](https://cocoapods.org/pods/Rapier)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

Rapier is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:
(not fully automatic yet)
```
pod 'Rapier/AutoIntegrate'
```
This will also pull in sourcery, which is used for code generation.
Then use the follwing script in a pre compile build phse:
```
sourcerycmd="$PODS_ROOT/Sourcery/bin/sourcery"
normal_template_location="$PODS_ROOT/Rapier/Templates"
example_template_location="$PODS_ROOT/../../Rapier/Templates"
if [ -d "$normal_template_location" ]; then
  template_location="$normal_template_location"
else
  template_location="$example_template_location"
fi

$sourcerycmd --templates "$template_location" --sources "$SRCROOT" --exclude-sources "$PODS_ROOT" --exclude-sources "$SRCROOT/PODS"  --output "$SRCROOT/Generated" --verbose
```
Your projects Sourceroot should contain a folder 'Generated'. Add it to your xcode project, done.


If you don't like the default integration, just add

```
pod 'Rapier'
```
to your project, but you need to setup your sourcery integration manually.
Note: This pods uses swifttemplates, which aren't supported by the hoenrew release of sourcery.
(Use the sourcery release tap instead, or include sourcery via cocoapods.)

## Author

kaygro, kay@dein-superheld.de

## License

Rapier is available under the MIT license. See the LICENSE file for more info.
