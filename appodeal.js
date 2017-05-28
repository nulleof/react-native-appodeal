import { NativeModules, DeviceEventEmitter, NativeAppEventEmitter } from 'react-native';

const Appodeal = NativeModules.Appodeal;

const eventHandlers = {};

const addEventListener = (type, handler) => {
  switch (type) {
    case 'onSizeChange':
      eventHandlers[type].set(handler, DeviceEventEmitter.addListener(type, handler));
      break;
    case 'onBannerLoaded':
    case 'onBannerShown':
    case 'onBannerClicked':
    case 'onBannerFailedToLoad':
    case 'onInterstitialLoaded':
    case 'onInterstitialFailedToLoad':
    case 'onInterstitialClosed':
    case 'onInterstitialClicked':
    case 'onInterstitialShown':
    case 'onNonSkippableVideoLoaded':
    case 'onNonSkippableVideoFailedToLoad':
    case 'onNonSkippableVideoShown':
    case 'onNonSkippableVideoClosed':
    case 'onNonSkippableVideoFinished':
    case 'onNonSkippableVideoClicked':
    case 'onSkippableVideoLoaded':
    case 'onSkippableVideoFailedToLoad':
    case 'onSkippableVideoShown':
    case 'onSkippableVideoClosed':
    case 'onSkippableVideoFinished':
    case 'onSkippableVideoClicked':
    case 'onRewardedVideoLoaded':
    case 'onRewardedVideoFailedToLoad':
    case 'onRewardedVideoShown':
    case 'onRewardedVideoClosed':
    case 'onRewardedVideoFinished':
    case 'onRewardedVideoClicked':
      eventHandlers[type].set(handler, NativeAppEventEmitter.addListener(type, handler));
      break;
    default:
      break;
  }
};

const removeEventListener = (type, handler) => {
  if (!eventHandlers[type].has(handler)) {
    return;
  }
  eventHandlers[type].get(handler).remove();
  eventHandlers[type].delete(handler);
};

const removeAllListeners = () => {
  DeviceEventEmitter.removeAllListeners();
  NativeAppEventEmitter.removeAllListeners();
};

const INTERSTITIAL = 1;
const SKIPPABLE_VIDEO = 2;
const BANNER = 4;
const BANNER_BOTTOM = 8;
const BANNER_TOP = 16;
const REWARDED_VIDEO = 128;
const NON_SKIPPABLE_VIDEO = 256;

module.exports = {
  ...Appodeal,
  addEventListener,
  removeEventListener,
  removeAllListeners,
  INTERSTITIAL,
  SKIPPABLE_VIDEO,
  BANNER,
  BANNER_BOTTOM,
  BANNER_TOP,
  REWARDED_VIDEO,
  NON_SKIPPABLE_VIDEO,
};
