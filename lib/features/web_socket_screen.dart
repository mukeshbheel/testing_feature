import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uuid/uuid.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import '../utils/constants.dart';
import 'package:web_socket_channel/status.dart' as status;

class WebSocketScreen extends StatefulWidget {
  const WebSocketScreen({super.key});

  @override
  State<WebSocketScreen> createState() => _WebSocketScreenState();
}

class _WebSocketScreenState extends State<WebSocketScreen> {
  late final WebSocketChannel channel;
  List chatMessages = [];
  final TextEditingController textFormField = TextEditingController();
  late final id ;


  @override
  void initState() {
    // TODO: implement initState
    initializeSocket();
    super.initState();
  }

  initializeSocket()async{
    try{
      var uuid = Uuid();

      // Generate a v1 (time-based) id
      id = uuid.v1();
      channel = WebSocketChannel.connect(Uri.parse("ws://192.168.1.3:6000"));
      await channel.ready;
      channel.stream.listen((message) {
        if (message is Uint8List) {
          // Convert the binary data to a string using utf8.decode
          String decodedMessage = utf8.decode(message);
          setState(() {
            chatMessages.add(jsonDecode(decodedMessage)); // Add decoded message to the list
          });
        } else if (message is String) {
          // Handle text message directly
          setState(() {
            chatMessages.add(jsonDecode(message));
          });
        }

        debugPrint(chatMessages.toString());

      });
      setState(() {

      });
    }
    on WebSocketChannelException catch(e) {
      print("sldkjflsdkj");
      print(e.inner);
    }
    catch(e){
      print(e.toString());
    }
  }

  void sendMessage(){
    FocusScope.of(context).unfocus();
    if(textFormField.text.isNotEmpty){
      Map messageObject = {
        "id" : id,
        "message" : textFormField.text,
      };
      channel.sink.add(jsonEncode(messageObject));
      Future.delayed(Duration(seconds: 1), (){
        textFormField.clear();
      });
    }
  }

  @override
  void dispose() {
    channel.sink.close(status.goingAway);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          'Chat Room',
          style: googleFontStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 20,),
          if(chatMessages.isEmpty)
          Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Start Texting", style: googleFontStyle(color: Colors.black),),
            ),
          ),
          Expanded(
            child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index)=>Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(chatMessages[index]['message'].toString(), style: googleFontStyle(color: Colors.blue), textAlign: chatMessages[index]['id'] == id ? TextAlign.right : TextAlign.left ,),
                  ),
                ),
              ),
              separatorBuilder: (context, index)=>SizedBox(height: 10,),
              itemCount: chatMessages.length,
            ),
          ),
          const SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(child: TextFormField(controller: textFormField, onFieldSubmitted: (v){
                  sendMessage();
                },)),
                SizedBox(width: 10,),
                IconButton(onPressed: sendMessage, icon: Icon(Icons.send, color: Colors.blue,))
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),

          const SizedBox(
            height: 20,
          ),
          // const CommonShowCode(
          //   codeText: CodeText.multiThreadCode,
          // )
        ],
      ),
    );
  }
}

