import 'package:be_meusi_ai/helper_functions/fb_ad.dart';
import 'package:be_meusi_ai/helper_functions/global.dart';
import 'package:be_meusi_ai/modle/enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lottie/lottie.dart';

class HomeCard extends StatelessWidget {
  final HomeType homeType;
  const HomeCard({super.key, required this.homeType});

  @override
  Widget build(BuildContext context) {
   Animate.restartOnHotReload =true;


    return Card(
      color: Colors.blue.withOpacity(.2),
      elevation: 0,
      margin: EdgeInsets.only(bottom: mq.height * .02),
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
      child:InkWell(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        onTap: ()=> FacebookAd.showInterstitialAd(homeType.OnTap),
        child:homeType.leftAlign ? Row(
        children: [
           Container(
            width: mq.width * .35,
             padding: homeType.padding,
             child: Lottie.asset('assets/${homeType.lottie}'),
           ),
    
          const Spacer(),
    
           Text(homeType.title,
          style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w500,letterSpacing: 1)),
    
          const Spacer(flex: 2),
        ],
      ):  
      Row(
        children: [
         
    
          const Spacer(flex: 2),
    
           Text(homeType.title,
          style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w500,letterSpacing: 1)),
    
          const Spacer(),
    
           Container(
            width: mq.width * .35,
             padding: homeType.padding,
             child: Lottie.asset('assets/${homeType.lottie}'),
           ),
        ],
      ), )
    ).animate()
           .scale(duration: 2.seconds,curve: Curves.easeIn);
  }
}