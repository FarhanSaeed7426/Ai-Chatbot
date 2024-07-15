    import 'dart:developer';

import 'package:appwrite/appwrite.dart';
import 'package:be_meusi_ai/helper_functions/global.dart';


class AppWrite{
 static final _client = Client();
 static final _database = Databases(_client);

static  void init(){
_client
    .setEndpoint('https://cloud.appwrite.io/v1')
    .setProject('6660baa5002057abc65b')
    .setSelfSigned(status: true); // For self signed certificates, only use for development
    getApiKey();
  }

  static Future<String> getApiKey() async{
    try{
   final d = await _database.getDocument(
      databaseId: 'AiDatabase',
       collectionId: 'ApiKey',
        documentId: 'ChatGptKey');

        apiKey = d.data['apiKey'];
        log(apiKey); 
        return apiKey;
    }
    catch(e){
      log('$e');
      return '';
    }
  }
}