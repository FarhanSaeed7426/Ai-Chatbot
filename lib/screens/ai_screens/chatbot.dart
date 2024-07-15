
import 'package:be_meusi_ai/apis/controller/chat_controller.dart';
import 'package:be_meusi_ai/main.dart';
import 'package:be_meusi_ai/widgets_custom/message_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:speech_to_text/speech_to_text.dart';

import '../../helper_functions/global.dart';

class ChatBot extends StatefulWidget {
  const ChatBot({super.key});

  @override
  State<ChatBot> createState() => _ChatBotState();
}

class _ChatBotState extends State<ChatBot> {
  final _c = ChatController();
  final SpeechToText _speechToText = SpeechToText();
  // ignore: unused_field
  bool _speechEnabled = false;
  String _wordSpoken ='';
  // ignore: unused_field
  double _confidenceLevel = 0;

  @override
  void initState() {
    super.initState();
    initSpeech();
  }

  Future<void> initSpeech() async {
  _speechEnabled = await _speechToText.initialize(); 
  setState(() {});
  }

  void _startListening() async{
    await _speechToText.listen(onResult: _onSpeechResult);
    setState(() {
      _confidenceLevel = 0;
    });
  }

  void _stopListening () async {
    await _speechToText.stop();
    setState(() {
      
    });
  }

   // ignore: unused_element
   void _onSpeechResult(result) {
    setState(() {
      _wordSpoken = "${result.recognizedWords}";
      _confidenceLevel = result.confidence;
      _c.textC.text = _wordSpoken; // Set the recognized words to the text field controller
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //app bar
      appBar: AppBar(
        title: const Text('Chat with BeMeusi AI'),
      ),

      //send message field & btn
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(children: [
          //text input field
          Expanded(
              child: TextFormField(
            controller: _c.textC,
            textAlign: TextAlign.center,
            onTapOutside: (e) => FocusScope.of(context).unfocus(),
            decoration: InputDecoration(
                fillColor: Theme.of(context).scaffoldBackgroundColor,
                filled: true,
                isDense: true,
                hintText: 'Ask me anything ...',
                hintStyle: const TextStyle(fontSize: 14),
                border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50)))),
          )),
          
          const SizedBox(width: 8),

          //for speech voice
          FloatingActionButton(
            onPressed: _speechToText.isListening ? _stopListening : _startListening, tooltip: 'Listen',
            child: Icon(
              _speechToText.isNotListening ? Icons.mic_off : Icons.mic,
              
            ),
            ),
          

          //for adding some space
          const SizedBox(width: 8),

          //send button
          CircleAvatar(
            radius: 24,
            backgroundColor: Theme.of(context).buttonColor,
            child: IconButton(
              onPressed: _c.askQuestion,
              icon: const Icon(Icons.rocket_launch_rounded,
                   size: 28),
            ),
          )
        ]),
      ),

      //body
      body: Obx(
        () => ListView(
          physics: const BouncingScrollPhysics(),
          controller: _c.scrollC,
          padding:
              EdgeInsets.only(top: mq.height * .02, bottom: mq.height * .1),
          children: _c.list.map((e) => MessageCard(message: e)).toList(),
        ),
      ),
    );
  }
}
