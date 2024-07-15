import 'package:flutter/material.dart';

class UiUxDesigner extends StatefulWidget {
  const UiUxDesigner({super.key});

  @override
  State<UiUxDesigner> createState() => _UiUxDesignerState();
}

class _UiUxDesignerState extends State<UiUxDesigner> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Ui Ux'),
      ),
       floatingActionButton:
         FloatingActionButton(
          onPressed: (){},
         
          child: const Icon(Icons.save_alt_rounded,size: 27,),
        ),
    );
  }
}