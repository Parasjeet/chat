import 'package:chat/constants/color.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chats',style: TextStyle(fontWeight: FontWeight.bold),),
        backgroundColor: KBackgraound,
        scrolledUnderElevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: CircleAvatar(
              backgroundImage: Image(image:AssetImage('assets/images/user.png'),).image,
            ),
          )
        ],
      ),
      body: ListView.builder(itemCount:10,itemBuilder:(context, index) {
        return ListTile(
          onTap: (){
            Navigator.pushNamed(context, 'Chat');
          },
          leading: Stack(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage('assets/images/user.png'),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: CircleAvatar(
                  backgroundColor:Colors.green,
                  radius: 6,
                ),
              )
            ],
          ),
          title: Text('Other Users'),
          subtitle: Text('Hey, how are you ?'),
          trailing: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: KprimaryColor,
                radius: 10,
                child: Text('10',style: TextStyle(color: Colors.white,fontSize: 11),),
              ),
              SizedBox(height: 5,),
              Text('12:05'),
            ],
          ),
        );
      },),
      floatingActionButton: FloatingActionButton(onPressed: (){},child: Icon(Icons.chat),),
    );
  }
}
