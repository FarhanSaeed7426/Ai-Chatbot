import 'dart:developer';

import 'package:be_meusi_ai/helper_functions/comments.dart';
import 'package:easy_audience_network/easy_audience_network.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FacebookAd{


  static void init(){
    EasyAudienceNetwork.init(
  testMode: true, // optional
);
  }
  static void showInterstitialAd(VoidCallback onComplete){
    MyDialog.showLoadingDialog();

    


    final interstitialAd = InterstitialAd(InterstitialAd.testPlacementId);
    interstitialAd.listener = InterstitialAdListener(
    onLoaded: () {

      Get.back();
    interstitialAd.show();
    onComplete();
  },
  onDismissed: () {
    interstitialAd.destroy();
  },
  onError: (i, e){

    Get.back();
    onComplete();
    log('interstitial error: $e');
  }
);
interstitialAd.load();
  }

  static Widget nativeAd() {
   return SafeArea(
     child: NativeAd(
       placementId: NativeAd.testPlacementId,
       adType: NativeAdType.NATIVE_AD,
       // set false if you want to collapse the native ad view when the ad is loading
       keepExpandedWhileLoading: false, 
       //in milliseconds. Expands the adview with animation when ad is loaded
       expandAnimationDuraion: 1000, 
       listener: NativeAdListener(
      onError: (code, message) => log('error'),
      onLoaded: () => log('loaded'),
      onClicked: () => log('clicked'),
      onLoggingImpression: () => log('logging impression'),
      onMediaDownloaded: () => log('media downloaded'),
       ),
     ),
   );
  }

   static Widget nativeBannerAd() {
   return SafeArea(
     child: NativeAd(
      placementId: NativeAd.testPlacementId,
  adType: NativeAdType.NATIVE_BANNER_AD,
  bannerAdSize: NativeBannerAdSize.HEIGHT_100,
       // set false if you want to collapse the native ad view when the ad is loading
       keepExpandedWhileLoading: false, 
       height: 100,
       //in milliseconds. Expands the adview with animation when ad is loaded
       expandAnimationDuraion: 1000, 
       listener: NativeAdListener(
      onError: (code, message) => log('error'),
      onLoaded: () => log('loaded'),
      onClicked: () => log('clicked'),
      onLoggingImpression: () => log('logging impression'),
      onMediaDownloaded: () => log('media downloaded'),
       ),
     ),
   );
  }
}