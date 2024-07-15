import 'package:be_meusi_ai/main.dart';
import 'package:be_meusi_ai/modle/onboard.dart';
import 'package:be_meusi_ai/screens/home.dart';
import 'package:be_meusi_ai/widgets_custom/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../helper_functions/global.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
   final c = PageController();

   final list = [Onboard(title: 'Ask me Anything',
    subtitle: 'You can ask me anything, I will help you!',
    lottie: 'Animation - 1717248814215'),
    
    Onboard(title: 'Imagination to Reality',
     subtitle: 'Just imagine & let me know,I will create it for you',
      lottie: 'Animation - 1717248929613')
    
    ];

    return Scaffold(
      body:PageView.builder(
        controller: c,
        itemCount: list.length,
        itemBuilder: (context, index) {
         final isLast = index == list.length -1 ;


        return  Column(
        children: [
        Lottie.asset('assets/${list[index].lottie}.json',height: mq.height * .7,width: isLast ? mq.width *1: null),
        // title
         Text(list[index].title,
        style: const TextStyle(fontSize: 18,fontWeight: FontWeight.w800,letterSpacing: .5),),

        SizedBox(height: mq.height * .016,),

       // subtitle
       SizedBox(
        width: mq.width * .7,
         child:  Text(list[index].subtitle,
         textAlign: TextAlign.center,
          style:  TextStyle(fontSize: 13,letterSpacing: .5,color:Theme.of(context).lightTextColor),),
       ),
        const Spacer(), 


       //dots
       Wrap(
        spacing: 10,
        children: List.generate(
          list.length,
          (i) => Container(
            width: i == index ? 15: 10,
            height: 8,
            decoration:  BoxDecoration(color: i == index ?Colors.blue : Colors.grey,
            borderRadius: const BorderRadius.all(Radius.circular(5))),
          )),
       ),
       const Spacer(),
      // button
      Button(onTap: (){
          if(isLast){
            Get.off(() => const HomeScreen());
          // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=> const HomeScreen()));
          }else{
            c.nextPage(duration: const Duration(milliseconds: 600), curve: Curves.ease);
          }
        },
         text:  isLast ? 'Finish' : 'Next'),
      

         const Spacer(flex: 2),



      ],);
 
      },)   );
  }
}