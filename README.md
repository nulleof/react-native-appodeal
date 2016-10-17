# react-native-appodeal
React native appodeal module. Allow show banner and interstitial ad on both platforms (Android and iOS)

## Installation

```
npm i -S react-native-appodeal
```

And then link native modules with:
```
react-native link
```

### iOS
You should add this to your Podfile:
```
platform :ios, '8.1'
use_frameworks!

source 'https://github.com/appodeal/CocoaPods.git'
source 'https://github.com/CocoaPods/Specs.git'

target 'project-name' do
    pod 'Appodeal', '~> 1.1'
end
```

And then run pod command:
```
$ cd {project-dir}/ios
$ pod install
```

For now, if you haven't use pods in your project you should use *.xcworkspace as your project file for build and running application in XCode.