import 'package:be_meusi_ai/apis/app_write.dart';
import 'package:be_meusi_ai/helper_functions/fb_ad.dart';
import 'package:be_meusi_ai/helper_functions/global.dart';
import 'package:be_meusi_ai/helper_functions/pref.dart';
import 'package:be_meusi_ai/screens/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Pref.initialize();

  AppWrite.init();

  // for fb adds
  FacebookAd.init();

await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      
      title: appName,
      debugShowCheckedModeBanner: false,

    themeMode: Pref.defaultTheme,

  //  dark
    darkTheme: ThemeData(
      useMaterial3: false,
      brightness: Brightness.dark,
      appBarTheme: const AppBarTheme(
       elevation: 1,
      centerTitle: true,
      titleTextStyle:TextStyle(
      fontSize: 20,fontWeight: FontWeight.w500))
     ), 



    //  light
     theme: ThemeData(
      useMaterial3: false,
      appBarTheme: const AppBarTheme(
       elevation: 1,
      centerTitle: true,
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(color: Colors.blue),
      titleTextStyle:TextStyle(color: Colors.blue,
      fontSize: 20,fontWeight: FontWeight.w500))
     ),

      home: const SplashScreen(),
    ); 
  }
}

extension AppTheme on ThemeData {

  // light text color
  Color get lightTextColor => 
          brightness == Brightness.dark ? Colors.white70 : Colors.black54;
      //  button color
           Color get buttonColor => 
          brightness == Brightness.dark ? Colors.cyan : Colors.blue;
}