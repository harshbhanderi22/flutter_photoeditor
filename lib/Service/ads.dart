import 'package:facebook_audience_network/facebook_audience_network.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class FaceBookAds extends StatelessWidget {
  const FaceBookAds({
    super.key,
  });

  void showInter() {
    FacebookInterstitialAd.loadInterstitialAd(
      placementId: "IMG_16_9_APP_INSTALL#YOUR_PLACEMENT_ID",
      listener: (result, value) {
        if (result == InterstitialAdResult.LOADED) {
          FacebookInterstitialAd.showInterstitialAd();
        } else {
          if (kDebugMode) {
            print(value.toString());
          }
        }
      },
    );
  }

  Widget nativeAd() {
    return FacebookNativeAd(
      placementId: "CAROUSEL_IMG_SQUARE_APP_INSTALL#YOUR_PLACEMENT_ID",
      adType: NativeAdType.NATIVE_AD,
      listener: (result, value) {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return FacebookNativeAd(
      placementId: "IMG_16_9_APP_INSTALL#YOUR_PLACEMENT_ID",
      adType: NativeAdType.NATIVE_BANNER_AD,
      height: 50,
      listener: (result, value) {
        switch (result) {
          case NativeAdResult.ERROR:
            if (kDebugMode) {
              print("Error: $value");
            }
            break;
          case NativeAdResult.LOADED:
            if (kDebugMode) {
              print("Loaded: $value");
            }
            break;
          case NativeAdResult.CLICKED:
            if (kDebugMode) {
              print("Clicked: $value");
            }
            break;
          case NativeAdResult.LOGGING_IMPRESSION:
            if (kDebugMode) {
              print("Logging Impression: $value");
            }
            break;
          case NativeAdResult.MEDIA_DOWNLOADED:
            if (kDebugMode) {
              print("Media DOwnloaded");
            }
            break;
        }
      },
    );
  }
}
