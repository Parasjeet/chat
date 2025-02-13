import 'package:chat/constants/color.dart';
import 'package:flutter/material.dart';

class SearchUser extends StatefulWidget {
  const SearchUser({super.key});

  @override
  State<SearchUser> createState() => _SearchUserState();
}

class _SearchUserState extends State<SearchUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Users',style: TextStyle(fontWeight: FontWeight.bold),),
        bottom: PreferredSize(preferredSize:Size.fromHeight(50) , child: Padding(
          padding: const EdgeInsets.only(left: 15,right: 15),
          child: Container(
            decoration: BoxDecoration(
              color: KSecondaryColor,
              borderRadius: BorderRadius.circular(6)
            ),
            margin: EdgeInsets.symmetric(vertical: 8),
            padding: EdgeInsets.symmetric(horizontal: 12,vertical: 4),
            child: Row(
              children: [
                Expanded(child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter phone number'
                  ),
                )),
                Icon(Icons.search)
              ],
            ),
          ),
        )),
      ),
    );
  }
}
