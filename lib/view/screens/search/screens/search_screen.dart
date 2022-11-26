import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20,),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color.fromARGB(255, 63, 72, 82),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search,color: Colors.white,),
                    hintText: 'Search your movies...',
                    border: InputBorder.none
                  ),
                ),
              ),
              Text('Trending Searches',style: TextStyle(
                fontSize: 20,fontWeight: FontWeight.w600
               ),),
            ],
          ),
        ),
      ),
    );
  }
}