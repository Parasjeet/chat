import 'package:chat/Screens/chat.dart';
import 'package:chat/Screens/homepage.dart';
import 'package:chat/Screens/phone_login.dart';
import 'package:chat/Screens/profile.dart';
import 'package:chat/Screens/search_user.dart';
import 'package:chat/Screens/update_profile.dart';
import 'package:chat/controllers/appwrite_controllers.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      routes: {
        '/': (context) => CheckUserSessions(),
        'PhoneLogin': (context) => PhoneLogin(),
        'HomePage': (context) => Homepage(),
        'Chat': (context) => Chat(),
        'Profile': (context) => Profile(),
        'UpdateProfile': (context) => UpdateProfile(),
        'SearchUser': (context) => SearchUser(),
      }
    );
  }
}


class CheckUserSessions extends StatefulWidget {
  const CheckUserSessions({super.key});

  @override
  State<CheckUserSessions> createState() => _CheckUserSessionsState();
}

class _CheckUserSessionsState extends State<CheckUserSessions> {

  @override
  void initState() {
    checkSession().then((value){
      if(value){
        Navigator.pushNamedAndRemoveUntil(context, 'HomePage', (route) => false,);
      }
      else{
        Navigator.pushNamedAndRemoveUntil(context, 'PhoneLogin', (route) => false,);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}


