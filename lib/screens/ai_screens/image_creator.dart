import 'package:be_meusi_ai/apis/controller/image_controller.dart';
import 'package:be_meusi_ai/helper_functions/global.dart';
import 'package:be_meusi_ai/widgets_custom/button.dart';
import 'package:be_meusi_ai/widgets_custom/loading.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class ImageCreator extends StatefulWidget {
  const ImageCreator({super.key});

  @override
  State<ImageCreator> createState() => _ImageCreatorState();
}

class _ImageCreatorState extends State<ImageCreator> {
  final _c = ImageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Image With BeMeusi AI'),
      ),


      floatingActionButton: Obx (() => _c.status.value == Status.complete ? Padding(
        padding: const EdgeInsets.only(right: 6,bottom: 6),
        child: FloatingActionButton(
          onPressed: 
            _c.downloadImage,
          
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15))
          ),
          child: const Icon(Icons.save_alt_rounded,size: 27,),
        ),
      ): const SizedBox()),
        
      


      body: ListView(
         physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.only(top: mq.height * .02,bottom: mq.height * .01,left: mq.width * .04,right: mq.width * .04 ),
        children: [
           TextFormField(
                   controller: _c.textC,
             textAlign: TextAlign.center,
             minLines: 2,
             maxLines:null,
             onTapOutside: (e) => FocusScope.of(context).unfocus(),
             decoration: const InputDecoration(
              
              hintText: 'Ask me anything .....\n I Will Create It For You',
              hintStyle: TextStyle(fontSize: 14),
              border: OutlineInputBorder(borderRadius:
               BorderRadius.all(Radius.circular(10)))),
        
              ),
              //ai image
              Container(
                height: mq.height * .5,
                margin: EdgeInsets.symmetric(vertical: mq.height * .015),
                alignment: Alignment.center,
                child:
                Obx(() => _aiImage())
                
              ),
// for lexica image generator use the code down below
              // Obx(() => _c.imageList.isEmpty ? const SizedBox() : SingleChildScrollView(
              //   scrollDirection: Axis.horizontal,
              //   padding: EdgeInsets.only(bottom: mq.height * .02),
              //   physics:const BouncingScrollPhysics() ,
              //   child: Wrap(
              //     spacing: 10,
              //     children: _c.imageList
              //     .map((e) => InkWell(
              //       onTap: (){_c.url.value = e;},
              //       child: ClipRRect(
              //       borderRadius: const BorderRadius.all(Radius.circular(8)),
                    
              //         child: CachedNetworkImage(
              //          imageUrl:e,
              //           height: 100,
              //         errorWidget: (context, url, error) => const SizedBox(),
              //                          ),
              //       ),
              //     )).toList(),
              //   ),
              // ),),

                // button for lexica
                //  Button(onTap: _c.searchAiImage, text: 'Create'),
                //  button for chatgpt 
                  Button(onTap: _c.createAIImage, text: 'Create')
        ],
      ),
    );
  }

  Widget _aiImage()=>ClipRRect(
   borderRadius: const BorderRadius.all(Radius.circular(10)),
   child:  switch(_c.status.value){ 
    Status.none =>Lottie.asset('assets/Animation - 1717269838169.json',height: mq.height * .3),
    Status.complete => CachedNetworkImage(
        imageUrl:_c.url.value,
        placeholder: (context, url) => const CustomLoading(),
        errorWidget: (context, url, error) => const SizedBox(),
     ),
     Status.loading => const CustomLoading()
  },);
}