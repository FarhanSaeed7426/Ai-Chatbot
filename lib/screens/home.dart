 import 'package:be_meusi_ai/helper_functions/fb_ad.dart';
import 'package:be_meusi_ai/helper_functions/global.dart';
import 'package:be_meusi_ai/helper_functions/pref.dart';
import 'package:be_meusi_ai/modle/enum.dart';
import 'package:be_meusi_ai/widgets_custom/home_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

final _isDarkMode = Pref.isDarkMode.obs;

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    Pref.showOnBoarding = false;
  }

  @override
  Widget build(BuildContext context) {
  
   mq =MediaQuery.sizeOf(context);

    // APIs.getAnswer('hii');

    return  Scaffold(

     appBar: AppBar(
      
      title: const Text(appName,
     ),
      
      
      actions: [IconButton
      (
        padding: const EdgeInsets.only(right: 14),
        onPressed: (){
          Get.changeThemeMode(Pref.isDarkMode ? ThemeMode.light : ThemeMode.dark);

         _isDarkMode.value = !_isDarkMode.value;
         Pref.isDarkMode = _isDarkMode.value;
        },
       icon:  Obx(() =>
          Icon(
            _isDarkMode.value ?
          Icons.brightness_2_rounded
          :Icons.brightness_3_rounded,
          size: 28,),
       ))],
      ),

      bottomNavigationBar: FacebookAd.nativeAd(),

      body:  ListView(
        padding: EdgeInsets.symmetric(
          horizontal: mq.width *.03,vertical: mq.height* .015),
        children: HomeType.values.map((e) =>  HomeCard(homeType: e,)).toList(),
        ),
        
    );
  }
}