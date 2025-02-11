import 'package:chat/constants/color.dart';
import 'package:chat/models/Message_model.dart';
import 'package:flutter/material.dart';

class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {

  List message = [
    MessageModel(message: 'Hello', sender: '101', receiver: '202', timestamp: DateTime(2000), isSeenByReceiver: false),
    MessageModel(message: 'Hi', sender: '202', receiver: '101', timestamp: DateTime(2000), isSeenByReceiver: false),
    MessageModel(message: 'How are you ?', sender: '101', receiver: '202', timestamp: DateTime(2000), isSeenByReceiver: false),
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
    );
  }
}
