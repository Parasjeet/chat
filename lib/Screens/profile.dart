import 'package:chat/controllers/appwrite_controllers.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile',style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      body: ListView(
        children: [
         ListTile(
           onTap: (){
             Navigator.pushNamed(context, 'UpdateProfile');
           },
          title: Text('Current User'),
           subtitle: Text('+919876543210'),
           trailing: Icon(Icons.edit_outlined),
           leading:  CircleAvatar(
             backgroundImage: Image(image:AssetImage('assets/images/user.png'),).image,
           ),
        ),
          Divider(),
          ListTile(
            onTap: (){
              logoutuser();
              Navigator.pushNamedAndRemoveUntil(context, "PhoneLogin", (route) => false,);
            },
            leading: Icon(Icons.logout),
            title: Text('Logout'),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.info_outline),
            title: Text('About'),
          )
      ]
      ),
    );
  }
}
