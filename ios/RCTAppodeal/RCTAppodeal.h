//
//  AppodealPlugin.h
//
//
//  Created by Denis on 26.05.16.
//
//

#import <Foundation/Foundation.h>
#import "RCTBridgeModule.h"
#import "RCTBridge.h"
#import "RCTEventDispatcher.h"
#import <Appodeal/Appodeal.h>

@interface RCTAppodeal : NSObject <RCTBridgeModule, AppodealBannerDelegate, AppodealInterstitialDelegate, AppodealRewardedVideoDelegate, AppodealNonSkippableVideoDelegate, AppodealSkippableVideoDelegate>

@end
