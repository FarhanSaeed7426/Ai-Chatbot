
import 'package:be_meusi_ai/screens/ai_screens/chatbot.dart';
import 'package:be_meusi_ai/screens/ai_screens/image_creator.dart';
import 'package:be_meusi_ai/screens/ai_screens/language.dart';
import 'package:be_meusi_ai/screens/ai_screens/ui_ux_designer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum HomeType{aiChatBot, aiImage, aiTranslator,aiUiUxDesigner}


extension MyHomeType on HomeType{

  String get title => switch (this){
    
    HomeType.aiChatBot => 'AI ChatBot',
    HomeType.aiImage => 'AI Image Creator',
    HomeType.aiTranslator => 'Language Translator',
    HomeType.aiUiUxDesigner =>'Ui Ux Designer',
  };
  
  String get lottie => switch (this){
    
    HomeType.aiChatBot => 'Animation - 1717269634806.json',
    HomeType.aiImage => 'Animation - 1717269838169.json',
    HomeType.aiTranslator => 'Animation - 1717272001930.json',
    HomeType.aiUiUxDesigner => 'Animation - 1717269838169.json',
  };
  bool get leftAlign => switch (this){
    
    HomeType.aiChatBot => true,
    HomeType.aiImage => false,
    HomeType.aiTranslator => true,
    HomeType.aiUiUxDesigner => false,
  };

   EdgeInsets get padding => switch (this){
    
    HomeType.aiChatBot => EdgeInsets.zero,
    HomeType.aiImage =>  EdgeInsets.zero,
    HomeType.aiTranslator => const EdgeInsets.all(20),
     HomeType.aiUiUxDesigner => const EdgeInsets.all(20),
  };

  VoidCallback get OnTap => switch (this){
    
    HomeType.aiChatBot => () => Get.to(() => const ChatBot()),
    HomeType.aiImage => () => Get.to(() => const ImageCreator()),
    HomeType.aiTranslator => () => Get.to(() => const Translator()),
     HomeType.aiUiUxDesigner =>() => Get.to(() => const UiUxDesigner()) ,
  };
  
}