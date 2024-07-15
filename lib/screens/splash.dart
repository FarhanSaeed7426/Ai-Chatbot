import 'package:be_meusi_ai/helper_functions/global.dart';
import 'package:be_meusi_ai/helper_functions/pref.dart';
import 'package:be_meusi_ai/screens/home.dart';
import 'package:be_meusi_ai/screens/onboarding.dart';
import 'package:be_meusi_ai/widgets_custom/loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

@override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2),(){
    //   Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) =>
    //    Pref.showOnBoarding ? const OnboardingScreen() : const HomeScreen()));

    Get.off(() => Pref.showOnBoarding ? const OnboardingScreen() : const HomeScreen());
    
    });
    
  }


  @override
  Widget build(BuildContext context) {
  
   mq =MediaQuery.sizeOf(context);

    return Scaffold(
      body: SizedBox(
        width: double.maxFinite,
        child: Column(
          children: [

            const Spacer(flex: 2,),
            Card(
              shape: const RoundedRectangleBorder(
                borderRadius:BorderRadius.all(Radius.circular(20)) ),
              child:Padding(
                padding:  EdgeInsets.all(mq.width * .05),
                child: Image.asset('assets/logo.png.png',
                width: mq.width * .4,
                ),
              ) ,
              ),

              const Spacer(),
              const CustomLoading(),
              const Spacer()
          ],
        ),
      ),
    );
  }
}