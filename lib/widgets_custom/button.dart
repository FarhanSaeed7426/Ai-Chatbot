import 'package:be_meusi_ai/helper_functions/global.dart';
import 'package:be_meusi_ai/main.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const Button({super.key, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return  Align(
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(),
            textStyle: const TextStyle(fontSize: 17,fontWeight: FontWeight.w500),
            elevation: 0,
            backgroundColor: Theme.of(context).buttonColor,
            minimumSize: Size(mq.width * .4, 45)
          ),
          
          onPressed: onTap,
           child:  Text(text)),
    );
  }
}