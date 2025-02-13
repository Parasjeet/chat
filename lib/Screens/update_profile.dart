import 'package:chat/constants/color.dart';
import 'package:flutter/material.dart';


class UpdateProfile extends StatefulWidget {
  const UpdateProfile({super.key});

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Update"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 10,right: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            SizedBox(
              height:40,
            ),
            Stack(
              children: [
                CircleAvatar(
                  radius:120 ,
                  backgroundImage: AssetImage('assets/images/user.png'),
                ),
                Positioned(
                  bottom: 0,
                    right: 0,
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: KprimaryColor,
                        borderRadius: BorderRadius.circular(30),
                      ),
                  child: Icon(Icons.edit_rounded,color: Colors.white,),
                ))
              ],
            ),
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  color: KSecondaryColor,
                  borderRadius: BorderRadius.circular(12)
                ),
                margin: EdgeInsets.symmetric(vertical: 8.0),
                 padding: EdgeInsets.symmetric(vertical: 4.0,horizontal: 8),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter you name'
                  ),
                ),
              ),
                        SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  color: KSecondaryColor,
                  borderRadius: BorderRadius.circular(12)
                ),
                margin: EdgeInsets.symmetric(vertical: 8.0),
                 padding: EdgeInsets.symmetric(vertical: 4.0,horizontal: 8),
                child: TextFormField(
                  enabled: false,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Phone Numbrer'
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(onPressed: (){}, child: Text('Update'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: KprimaryColor,
                  foregroundColor: Colors.white
                ),),
              )
          ],),
        ),
      ),
    );
  }
}
