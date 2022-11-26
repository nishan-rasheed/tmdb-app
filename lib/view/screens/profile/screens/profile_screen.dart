import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final maxHeight = MediaQuery.of(context).size.height;
    final maxWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: maxHeight*.1,),
          const CircleAvatar(
            radius: 60,
          ),
          const SizedBox(height: 10,),
          const Text('Nishan Rasheed',style: TextStyle(
                fontSize: 20,fontWeight: FontWeight.bold
               ),),
          const ListTile(
            leading: Icon(Icons.person),
            title: Text('profile'),
          ),
          const ListTile(
            leading: Icon(Icons.favorite),
            title: Text('Favourites'),
          ),    
        ],
      ),
    );
  }
}