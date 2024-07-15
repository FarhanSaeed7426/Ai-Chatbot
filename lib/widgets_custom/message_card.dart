import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:be_meusi_ai/helper_functions/global.dart';
import 'package:be_meusi_ai/main.dart';
import 'package:be_meusi_ai/modle/message.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MessageCard extends StatelessWidget {
  final Message message;
  const MessageCard({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
   const r = Radius.circular(15);


    return message.msgType == MessageType.bot 
    //bot
    ? Row(
      children: [
        const SizedBox(width: 6),

        CircleAvatar(
          radius: 19,
          backgroundColor: Colors.white,
          child:Image.asset('assets/aibot.png.png',width: 50,) ,
        ),

        Container(
              constraints: BoxConstraints(maxWidth: mq.width * .6),
              margin: EdgeInsets.only(
                  bottom: mq.height * .02, left: mq.width * .02),
              padding: EdgeInsets.symmetric(
                  vertical: mq.height * .01, horizontal: mq.width * .02),
              decoration: BoxDecoration(
                  border: Border.all(color:Theme.of(context).lightTextColor),
                  borderRadius: const BorderRadius.only(
                      topLeft: r, topRight: r, bottomRight: r)),
                      child: GestureDetector(
            onLongPress: () {
              Clipboard.setData(ClipboardData(text: message.msg));
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Message copied to clipboard'))
              );
            },
              child: message.msg.isEmpty
                  ? AnimatedTextKit(animatedTexts: [
                      TypewriterAnimatedText(
                        ' Please wait... ',
                        speed: const Duration(milliseconds: 100),
                      ),
                    ], repeatForever: true)
                  : Text(
                      message.msg,
                      textAlign: TextAlign.center,
                    ),
            ))
          ])

    // user
    : Row(

      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        
        

        Container(
          constraints: BoxConstraints(maxWidth: mq.width * .6),
          margin: EdgeInsets.only(bottom: mq.height * .02, right: mq.width * .02),
          padding: EdgeInsets.symmetric(vertical: mq.height * .01, horizontal: mq.width * .02),
          decoration: BoxDecoration(border: Border.all(color: Theme.of(context).lightTextColor),
          borderRadius: const BorderRadius.only(topLeft: r,bottomRight: r)
          ),
          child: Text(message.msg)),


          const CircleAvatar(
          radius: 19,
          backgroundColor: Colors.white,
          child:Icon(Icons.person_3_sharp,color: Colors.blue) ,
        ),

          const SizedBox(width: 7),


      ],
    );
  }
}