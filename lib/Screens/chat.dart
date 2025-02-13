import 'package:chat/constants/chat_message.dart';
import 'package:chat/constants/color.dart';
import 'package:chat/models/Message_model.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {

  TextEditingController messageController = TextEditingController();
  List message = [
    MessageModel(message: 'Hello', sender: '101', receiver: '202', timestamp: DateTime(2025,1,1), isSeenByReceiver: true),
    MessageModel(message: 'Hi', sender: '202', receiver: '101', timestamp: DateTime(2025,1,1), isSeenByReceiver: false),
    MessageModel(message: 'How are you ?', sender: '101', receiver: '202', timestamp: DateTime(2025,1,1), isSeenByReceiver: false),
    MessageModel(message: 'How are you ?', sender: '101', receiver: '202', timestamp: DateTime(2025,1,1), isSeenByReceiver: true),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KBackgraound,
      appBar: AppBar(
        backgroundColor: KBackgraound,
        leadingWidth: 40,
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/images/user.png'),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Other User',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  'Online',
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
          ],
        ),
      ),

      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: ListView.builder(itemCount: message.length, itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.fromLTRB(15,0,15,5),
                child: ChatMessage(msg: message[index], currentUser: "101", isImage:true),
              ),),
            ),
          ),
          Container(
            margin: 
            EdgeInsets.all(6),
            padding: EdgeInsets.symmetric(horizontal: 8,vertical: 4),
            decoration: BoxDecoration(color: KSecondaryColor,borderRadius:BorderRadius.circular(20)),
            child: Row(
              children: [
                Expanded(child: TextFormField(
                  controller: messageController,
                  decoration: InputDecoration(
                    border:InputBorder.none,
                    hintText: 'Type a message...'
                  ),
                )),
                IconButton(onPressed: (){}, icon: Icon(Icons.image)),
                IconButton(onPressed: (){}, icon: Icon(Icons.send)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
