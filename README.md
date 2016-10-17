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