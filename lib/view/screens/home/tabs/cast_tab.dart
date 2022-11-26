import 'package:flutter/material.dart';

class CastTab extends StatelessWidget {
  const CastTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        physics:const ScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: (){
              
            },
            child: Column(
              children:const [
                CircleAvatar(radius: 50,
                backgroundImage: NetworkImage('https://www.themoviedb.org/t/p/w600_and_h900_bestv2/9hJ59ogLxgcZDkvfGcjLHqbB5Pl.jpg'),),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: Text('Andrew Garfield'),
                ),
                Text('(as Peter parker)')
              ],
            ),
          );
        },
      ),
    );
  }
}