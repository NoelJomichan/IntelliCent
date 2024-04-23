import 'dart:convert';

import 'package:bubble/bubble.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class ChatBot extends StatefulWidget {
  const ChatBot({Key? key}) : super(key: key);

  @override
  State<ChatBot> createState() => _ChatBotState();
}

class _ChatBotState extends State<ChatBot> {


  final GlobalKey<AnimatedListState> _listKey = GlobalKey();
  List<String> _data = [];
  final BOT_URL = Uri.parse("http://10.0.2.2:7000/bot") ;
  TextEditingController _queryController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat Bot'),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: ()async {
      //     try {
      //       String mistralResponse = await sendPromptToMistral('hi my name is noel');
      //       print(mistralResponse);
      //       // Handle Mistral AI response here
      //     } catch (e) {
      //       print(e);
      //       // Handle error
      //     }
      //   },
      // ),
      body: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 70.0,),
            child: AnimatedList(
                key: _listKey,
                initialItemCount: _data.length,
                itemBuilder: (BuildContext context, int index, Animation<double> animation){
                  return _buildItem(_data[index], animation, index);
                }
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10),
            child: Align(
              alignment: Alignment.bottomCenter,
              child:
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Write a message",
                      suffixIcon: GestureDetector(
                        onTap: (){
                          return _getResponse();
                        },
                          child: const Icon(Icons.send)
                      )
                    ),
                    controller: _queryController,
                    textInputAction: TextInputAction.send,
                    onSubmitted: (msg){
                      return _getResponse();
                    },
                  ),
            ),
          )
        ],
      )
    );
  }


  http.Client _getClient(){
    return http.Client();
  }

  void _getResponse() {
    if (_queryController.text.isNotEmpty){
      _insertSingleItem(_queryController.text);
      var client = _getClient();
      print(client);
      try{
        String botUrl = 'http://10.0.2.2:7000/get-ai?prompt=${_queryController.text}';
        _queryController.clear();
        // client.post(BOT_URL, body: {"query" : _queryController.text},)
        //   .then((response){
        //   Map<String, dynamic> data = jsonDecode(response.body);
        //   _insertSingleItem(data['response']+"<bot>");

        client.get(Uri.parse(botUrl))
          .then((response){
            print('Response : ${response.body}');
            Map<String, dynamic> data = jsonDecode(response.body);
            _insertSingleItem(data['response']+"<bot>");
          });
      }catch(e){
        print("Failed -> $e");
      }finally{
        client.close();
        _queryController.clear();
      }
    }
  }

  void _insertSingleItem(String message){
    _data.add(message);
    _listKey.currentState?.insertItem(_data.length-1);
  }


  Widget _buildItem(String item, Animation<double> animation,int index){
    bool mine = item.endsWith("<bot>");
    return SizeTransition(
        sizeFactor: animation,
        child: Padding(padding: const EdgeInsets.only(top: 10),
          child: Container(
              alignment: mine ?  Alignment.topRight : Alignment.topLeft,

              child : Bubble(
                radius: const Radius.circular(15.0),
                color: mine ? Colors.deepOrangeAccent : Colors.white,
                padding: const BubbleEdges.all(10),
                child: Text(item.replaceAll("<bot>", "")),
              )),
        )

    );
  }
}

