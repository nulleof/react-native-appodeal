//
//  AppodealPlugin.m
//  AppodealReactDemo
//
//  Created by Denis on 26.05.16.
//
//

#import "RCTAppodeal.h"

const int INTERSTITIAL        = 1;
const int VIDEO               = 2;
const int BANNER              = 4;
const int BANNER_BOTTOM       = 8;
const int BANNER_TOP          = 16;
const int REWARDED_VIDEO      = 128;
const int NON_SKIPPABLE_VIDEO = 256;

int nativeAdTypesForType(int adTypes) {
    int nativeAdTypes = 0;
    
    if ((adTypes & INTERSTITIAL) > 0) {
        nativeAdTypes |= AppodealAdTypeInterstitial;
    }
    
    if ((adTypes & VIDEO) > 0) {
        nativeAdTypes |= AppodealAdTypeSkippableVideo;
    }
    
    if ((adTypes & BANNER) > 0 ||
        (adTypes & BANNER_TOP) > 0 ||
        (adTypes & BANNER_BOTTOM) > 0) {
        
        nativeAdTypes |= AppodealAdTypeBanner;
    }
    
    if ((adTypes & REWARDED_VIDEO) > 0) {
        nativeAdTypes |= AppodealAdTypeRewardedVideo;
    }
    
    if ((adTypes & NON_SKIPPABLE_VIDEO) >0) {
        nativeAdTypes |= AppodealAdTypeNonSkippableVideo;
    }
    
    return nativeAdTypes;
}

int nativeShowStyleForType(int adTypes) {
    bool isInterstitial = (adTypes & INTERSTITIAL) > 0;
    bool isVideo = (adTypes & VIDEO) > 0;
    
    if (isInterstitial && isVideo) {
        return AppodealShowStyleVideoOrInterstitial;
    } else if (isVideo) {
        return AppodealShowStyleSkippableVideo;
    } else if (isInterstitial) {
        return AppodealShowStyleInterstitial;
    }
    
    if ((adTypes & BANNER_TOP) > 0) {
        return AppodealShowStyleBannerTop;
    }
    
    if ((adTypes & BANNER_BOTTOM) > 0) {
        return AppodealShowStyleBannerBottom;
    }
    
    if ((adTypes & REWARDED_VIDEO) > 0) {
        return AppodealShowStyleRewardedVideo;
    }
    
    if ((adTypes & NON_SKIPPABLE_VIDEO) > 0) {
        return AppodealShowStyleNonSkippableVideo;
    }
    
    return 0;
}

@implementation RCTAppodeal

RCT_EXPORT_MODULE();

@synthesize bridge = _bridge;

//banner
- (void)bannerDidShow
{
    [self.bridge.eventDispatcher sendAppEventWithName:@"onBannerShown" body:@{@"":@""}];
}

- (void)bannerDidLoadAd
{
    [self.bridge.eventDispatcher sendAppEventWithName:@"onBannerLoaded" body:@{@"":@""}];
}

- (void)bannerDidClick
{
    [self.bridge.eventDispatcher sendAppEventWithName:@"onBannerClicked" body:@{@"":@""}];
}

- (void)bannerDidFailToLoadAd;
{
    [self.bridge.eventDispatcher sendAppEventWithName:@"onBannerFailedToLoad" body:@{@"":@""}];
}

//interstitial
- (void)interstitialDidLoadAd
{
    [self.bridge.eventDispatcher sendAppEventWithName:@"onInterstitialLoaded" body:@{@"":@""}];
}

- (void)interstitialDidFailToLoadAd
{
    [self.bridge.eventDispatcher sendAppEventWithName:@"onInterstitialFailedToLoad" body:@{@"":@""}];
}

- (void)interstitialWillPresent
{
    [self.bridge.eventDispatcher sendAppEventWithName:@"onInterstitialShown" body:@{@"":@""}];
}

- (void)interstitialDidDismiss;
{
    [self.bridge.eventDispatcher sendAppEventWithName:@"onInterstitialClosed" body:@{@"":@""}];
}

- (void)interstitialDidClick;
{
    [self.bridge.eventDispatcher sendAppEventWithName:@"onInterstitialClicked" body:@{@"":@""}];
}

// non skippable video
- (void)nonSkippableVideoDidLoadAd
{
    [self.bridge.eventDispatcher sendAppEventWithName:@"onNonSkippableVideoLoaded" body:@{@"":@""}];
}

- (void)nonSkippableVideoDidFailToLoadAd
{
    [self.bridge.eventDispatcher sendAppEventWithName:@"onNonSkippableVideoFailedToLoad" body:@{@"":@""}];
}

- (void)nonSkippableVideoDidPresent
{
    [self.bridge.eventDispatcher sendAppEventWithName:@"onNonSkippableVideoShown" body:@{@"":@""}];
}

- (void)nonSkippableVideoWillDismiss
{
    [self.bridge.eventDispatcher sendAppEventWithName:@"onNonSkippableVideoClosed" body:@{@"":@""}];
}

- (void)nonSkippableVideoDidFinish
{
    [self.bridge.eventDispatcher sendAppEventWithName:@"onNonSkippableVideoFinished" body:@{@"":@""}];
}

- (void)nonSkippableVideoDidClick
{
    [self.bridge.eventDispatcher sendAppEventWithName:@"onNonSkippableVideoClicked" body:@{@"":@""}];
}

// skippable video
- (void)skippableVideoDidLoadAd
{
    [self.bridge.eventDispatcher sendAppEventWithName:@"onSkippableVideoLoaded" body:@{@"":@""}];
}

- (void)skippableVideoDidFailToLoadAd
{
    [self.bridge.eventDispatcher sendAppEventWithName:@"onSkippableVideoFailedToLoad" body:@{@"":@""}];
}

- (void)skippableVideoDidPresent
{
    [self.bridge.eventDispatcher sendAppEventWithName:@"onSkippableVideoShown" body:@{@"":@""}];
}

- (void)skippableVideoWillDismiss
{
    [self.bridge.eventDispatcher sendAppEventWithName:@"onSkippableVideoClosed" body:@{@"":@""}];
}

- (void)skippableVideoDidFinish
{
    [self.bridge.eventDispatcher sendAppEventWithName:@"onSkippableVideoFinished" body:@{@"":@""}];
}

- (void)skippableVideoDidClick
{
    [self.bridge.eventDispatcher sendAppEventWithName:@"onSkippableVideoClicked" body:@{@"":@""}];
}

// rewarded video
- (void)rewardedVideoDidLoadAd
{
    [self.bridge.eventDispatcher sendAppEventWithName:@"onRewardedVideoLoaded" body:@{@"":@""}];
}

- (void)rewardedVideoDidFailToLoadAd
{
    [self.bridge.eventDispatcher sendAppEventWithName:@"onRewardedVideoFailedToLoad" body:@{@"":@""}];
}

- (void)rewardedVideoDidPresent
{
    [self.bridge.eventDispatcher sendAppEventWithName:@"onRewardedVideoShown" body:@{@"":@""}];
}

- (void)rewardedVideoWillDismiss
{
    [self.bridge.eventDispatcher sendAppEventWithName:@"onRewardedVideoClosed" body:@{@"":@""}];
}

- (void)rewardedVideoDidFinish:(NSUInteger)rewardAmount name:(NSString *)rewardName
{
    [self.bridge.eventDispatcher sendAppEventWithName:@"onRewardedVideoFinished" body:@{@"rewardAmount":[NSNumber numberWithInteger:rewardAmount],@"rewardName":rewardName}];
}

- (void)rewardedVideoDidClick
{
    [self.bridge.eventDispatcher sendAppEventWithName:@"onRewardedVideoClicked" body:@{@"":@""}];
}

RCT_EXPORT_METHOD(disableNetworkType:(NSString *)name types:(int)adType)
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [Appodeal disableNetworkForAdType:nativeAdTypesForType(adType) name:name];
    });
}

RCT_EXPORT_METHOD(disableLocationPermissionCheck)
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [Appodeal disableLocationPermissionCheck];
    });
}

RCT_EXPORT_METHOD(setAutoCache:(int)adType autoc:(BOOL)autocache)
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [Appodeal setAutocache:autocache types:nativeAdTypesForType(adType)];
    });
}

RCT_EXPORT_METHOD(isPrecache:(int)adType calls:(RCTResponseSenderBlock)callback)
{
    dispatch_async(dispatch_get_main_queue(), ^{
        if([Appodeal isAutocacheEnabled:nativeAdTypesForType(adType)])
            callback(@[@YES]);
        else
            callback(@[@NO]);
    });
}

RCT_EXPORT_METHOD(initializeWithApiKey:(NSString *)appKey types:(int)adType)
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [Appodeal initializeWithApiKey:appKey types:nativeAdTypesForType(adType)];
    });
}

RCT_EXPORT_METHOD(isInitalized:(RCTResponseSenderBlock)callback)
{
    dispatch_async(dispatch_get_main_queue(), ^{
        if([Appodeal isInitalized])
            callback(@[@YES]);
        else
            callback(@[@NO]);
    });
}

RCT_EXPORT_METHOD(enableInterstitialCallbacks:(BOOL)val)
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [Appodeal setInterstitialDelegate:self];
    });
}

RCT_EXPORT_METHOD(enableBannerCallbacks:(BOOL)val)
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [Appodeal setBannerDelegate:self];
    });
}

RCT_EXPORT_METHOD(enableSkippableVideoCallbacks:(BOOL)val)
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [Appodeal setSkippableVideoDelegate:self];
    });
}

RCT_EXPORT_METHOD(enableRewardedVideoCallbacks:(BOOL)val)
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [Appodeal setRewardedVideoDelegate:self];
    });
}

RCT_EXPORT_METHOD(enableNonSkippableVideoCallbacks:(BOOL)val)
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [Appodeal setNonSkippableVideoDelegate:self];
    });
}

RCT_EXPORT_METHOD(show:(int)showType result:(RCTResponseSenderBlock)callback)
{
    dispatch_async(dispatch_get_main_queue(), ^{
        if([Appodeal showAd:nativeShowStyleForType(showType) rootViewController:[[UIApplication sharedApplication] keyWindow].rootViewController])
            callback(@[@YES]);
        else
            callback(@[@NO]);
    });
}

RCT_EXPORT_METHOD(showWithPlacement:(int)showType placement:(NSString*)placement result:(RCTResponseSenderBlock)callback)
{
    dispatch_async(dispatch_get_main_queue(), ^{
        if([Appodeal showAd:nativeShowStyleForType(showType) forPlacement:placement rootViewController:[[UIApplication sharedApplication] keyWindow].rootViewController])
            callback(@[@YES]);
        else
            callback(@[@NO]);
    });
}

RCT_EXPORT_METHOD(cache:(int)adType)
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [Appodeal cacheAd:nativeAdTypesForType(adType)];
    });
}

RCT_EXPORT_METHOD(hide:(int)adType)
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [Appodeal hideBanner];
    });
}

RCT_EXPORT_METHOD(setLogging:(BOOL)log)
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [Appodeal setDebugEnabled:log];
    });
}

RCT_EXPORT_METHOD(setTesting:(BOOL)testingEnabled)
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [Appodeal setTestingEnabled:testingEnabled];
    });
}

RCT_EXPORT_METHOD(resetUUID)
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [Appodeal resetUUID];
    });
}

RCT_EXPORT_METHOD(getVersion:(RCTResponseSenderBlock)callback)
{
    dispatch_async(dispatch_get_main_queue(), ^{
        callback(@[[Appodeal getVersion]]);
    });
}

RCT_EXPORT_METHOD(isLoaded:(int)showType result:(RCTResponseSenderBlock)callback)
{
    dispatch_async(dispatch_get_main_queue(), ^{
        if([Appodeal isReadyForShowWithStyle:nativeShowStyleForType(showType)])
            callback(@[@YES]);
        else
            callback(@[@NO]);
    });
}

RCT_EXPORT_METHOD(setCustomRule:(NSString *)rule)
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [Appodeal setCustomRule:[NSJSONSerialization JSONObjectWithData:[rule dataUsingEncoding:NSUTF8StringEncoding] options:0 error:nil]];
    });
}

RCT_EXPORT_METHOD(setCustomDoubleRule:(NSString *)rule)
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [Appodeal setCustomRule:[NSJSONSerialization JSONObjectWithData:[rule dataUsingEncoding:NSUTF8StringEncoding] options:0 error:nil]];
    });
}

RCT_EXPORT_METHOD(setCustomIntegerRule:(NSString *)rule)
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [Appodeal setCustomRule:[NSJSONSerialization JSONObjectWithData:[rule dataUsingEncoding:NSUTF8StringEncoding] options:0 error:nil]];
    });
}

RCT_EXPORT_METHOD(setCustomStringRule:(NSString *)rule)
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [Appodeal setCustomRule:[NSJSONSerialization JSONObjectWithData:[rule dataUsingEncoding:NSUTF8StringEncoding] options:0 error:nil]];
    });
}

RCT_EXPORT_METHOD(setCustomBooleanRule:(NSString *)rule)
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [Appodeal setCustomRule:[NSJSONSerialization JSONObjectWithData:[rule dataUsingEncoding:NSUTF8StringEncoding] options:0 error:nil]];
    });
}

RCT_EXPORT_METHOD(confirm:(int)adType)
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [Appodeal confirmUsage:nativeAdTypesForType(adType)];
    });
}

RCT_EXPORT_METHOD(setSmartBanners:(BOOL)val)
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [Appodeal setSmartBannersEnabled:val];
    });
}

RCT_EXPORT_METHOD(setBannerBackground:(BOOL)val)
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [Appodeal setBannerBackgroundVisible:val];
    });
}

RCT_EXPORT_METHOD(setBannerAnimation:(BOOL)val)
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [Appodeal setBannerAnimationEnabled:val];
    });
}

RCT_EXPORT_METHOD(setUserId:(NSString *)userId)
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [Appodeal setUserId:userId];
    });
}

RCT_EXPORT_METHOD(setEmail:(NSString *)email)
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [Appodeal setUserEmail:email];
    });
}

RCT_EXPORT_METHOD(setBirthday:(NSString *)birthday)
{
    dispatch_async(dispatch_get_main_queue(), ^{
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"dd-MM-yyyy"];
        NSDate *dateFromString = [[NSDate alloc] init];
        dateFromString = [dateFormatter dateFromString:birthday];
        
        [Appodeal setUserBirthday:dateFromString];
    });
}

RCT_EXPORT_METHOD(setAge:(int)age)
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [Appodeal setUserAge:age];
    });
}

RCT_EXPORT_METHOD(setGender:(NSString *)AppodealUserGender)
{
    dispatch_async(dispatch_get_main_queue(), ^{
        if([AppodealUserGender isEqualToString:@"other"])
            [Appodeal setUserGender:AppodealUserGenderOther];
        if([AppodealUserGender isEqualToString:@"male"])
            [Appodeal setUserGender:AppodealUserGenderMale];
        if([AppodealUserGender isEqualToString:@"female"])
            [Appodeal setUserGender:AppodealUserGenderFemale];
    });
}

RCT_EXPORT_METHOD(setOccupation:(NSString *)AppodealUserOccupation)
{
    dispatch_async(dispatch_get_main_queue(), ^{
        if([AppodealUserOccupation isEqualToString:@"other"])
            [Appodeal setUserOccupation:AppodealUserOccupationOther];
        if([AppodealUserOccupation isEqualToString:@"work"])
            [Appodeal setUserOccupation:AppodealUserOccupationWork];
        if([AppodealUserOccupation isEqualToString:@"school"])
            [Appodeal setUserOccupation:AppodealUserOccupationSchool];
        if([AppodealUserOccupation isEqualToString:@"university"])
            [Appodeal setUserOccupation:AppodealUserOccupationUniversity];
    });
}

RCT_EXPORT_METHOD(setRelation:(NSString *)AppodealUserRelationship)
{
    dispatch_async(dispatch_get_main_queue(), ^{
        if([AppodealUserRelationship isEqualToString:@"other"])
            [Appodeal setUserRelationship:AppodealUserRelationshipOther];
        if([AppodealUserRelationship isEqualToString:@"single"])
            [Appodeal setUserRelationship:AppodealUserRelationshipSingle];
        if([AppodealUserRelationship isEqualToString:@"dating"])
            [Appodeal setUserRelationship:AppodealUserRelationshipDating];
        if([AppodealUserRelationship isEqualToString:@"engaged"])
            [Appodeal setUserRelationship:AppodealUserRelationshipEngaged];
        if([AppodealUserRelationship isEqualToString:@"married"])
            [Appodeal setUserRelationship:AppodealUserRelationshipMarried];
        if([AppodealUserRelationship isEqualToString:@"searching"])
            [Appodeal setUserRelationship:AppodealUserRelationshipSearching];
    });
}

RCT_EXPORT_METHOD(setSmoking:(NSString *)AppodealUserSmokingAttitude)
{
    dispatch_async(dispatch_get_main_queue(), ^{
        if([AppodealUserSmokingAttitude isEqualToString:@"negative"])
            [Appodeal setUserSmokingAttitude:AppodealUserSmokingAttitudeNegative];
        if([AppodealUserSmokingAttitude isEqualToString:@"neutral"])
            [Appodeal setUserSmokingAttitude:AppodealUserSmokingAttitudeNeutral];
        if([AppodealUserSmokingAttitude isEqualToString:@"positive"])
            [Appodeal setUserSmokingAttitude:AppodealUserSmokingAttitudePositive];
    });
}

RCT_EXPORT_METHOD(setAlcohol:(NSString *)AppodealUserAlcoholAttitude)
{
    dispatch_async(dispatch_get_main_queue(), ^{
        if([AppodealUserAlcoholAttitude isEqualToString:@"negative"])
            [Appodeal setUserAlcoholAttitude:AppodealUserAlcoholAttitudeNegative];
        if([AppodealUserAlcoholAttitude isEqualToString:@"neutral"])
            [Appodeal setUserAlcoholAttitude:AppodealUserAlcoholAttitudeNeutral];
        if([AppodealUserAlcoholAttitude isEqualToString:@"positive"])
            [Appodeal setUserAlcoholAttitude:AppodealUserAlcoholAttitudePositive];
    });
}

RCT_EXPORT_METHOD(setInterests:(NSString *)interests)
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [Appodeal setUserInterests:interests];
    });
}

@end
