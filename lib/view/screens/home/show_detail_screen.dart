import 'dart:convert';

import 'package:film_app/constants/api_constants.dart';
import 'package:film_app/sevices/api_service/cast_service.dart';
import 'package:film_app/sevices/api_service/similar_service.dart';
import 'package:film_app/sevices/controller/cast_controller.dart';
import 'package:film_app/sevices/controller/similar_controller.dart';
import 'package:film_app/view/screens/home/tabs/about_tab.dart';
import 'package:film_app/view/screens/home/tabs/cast_tab.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShowDemo extends StatelessWidget {
   ShowDemo({Key? key, 
   required this.poster, required this.backDrop, 
   required this.title, required this.year, 
   required this.rating, required this.plot, 
   required this.genre, required this.actorImage, 
   required this.actor, required this.character, required this.id}) : super(key: key);

 final String poster;final String backDrop;
 final String title;final String year;final String id;
 final String rating;final String plot;
 final String genre;final String actorImage;
 final String actor;final String character;

 
     CastController castController = Get.put(CastController());
     SimilarController similarController = Get.put(SimilarController());
  @override
   
  Widget build(BuildContext context) {
    castController.getCastDetail(id);
    similarController.getSimilarList(id);
    final maxHeight = MediaQuery.of(context).size.height;
    final maxWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(clipBehavior: Clip.none,
                children: [
                  Container(
                  height: maxHeight*.3,width: maxWidth,
                  decoration:BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(backDrop))
                  ),
                  ),
                  Positioned(
                    top: maxHeight*.2,
                    child: Row(crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left:maxWidth*.08),
                          height: maxHeight*.2,width: maxWidth*.3,
                          decoration: BoxDecoration(
                          image:DecorationImage(fit: BoxFit.fitHeight,
                          image: NetworkImage(poster)),           
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        SizedBox(width: maxWidth*.2,),

                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: ElevatedButton(
                            onPressed:(){}, 
                            child: Row(
                              children:const [
                                Text('Trailer',style: TextStyle(color: Colors.black),),
                                SizedBox(width: 5,),
                                Icon(Icons.play_arrow,color: Colors.black,)
                              ],
                            )),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(height: maxHeight*.12,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,style:const TextStyle(
                      fontSize: 18,fontWeight: FontWeight.bold
                    ),),
                    const SizedBox(height: 5,),
                    Padding(
                      padding:EdgeInsets.symmetric(horizontal: maxWidth*.05),
                      child: Row(
                        children: [
                          Text('( $year )',style:const TextStyle(
                            fontSize: 15,fontWeight: FontWeight.bold
                          ),),
                          const Spacer(),
                          const Icon(Icons.star_outlined,color: Colors.amber,),
                          const SizedBox(width:5),
                          const Text('7.3 / 10'),
                        ],
                      ),
                    ),
                    const Divider(color: Colors.white,),
                const Padding(
                  padding:EdgeInsets.symmetric(vertical: 10),
                  child: Text('Synopsis',style: TextStyle(
                      fontSize: 16,fontWeight: FontWeight.bold
                    ),),
                ),
                Text(plot),
                const Padding(
                  padding:EdgeInsets.symmetric(vertical: 10),
                  child: Text('Genre : Action , Adventure , Thriller',style: TextStyle(
                      fontSize: 16,fontWeight: FontWeight.bold
                    ),),
                ),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Starring',style: TextStyle(
                      fontSize: 18,fontWeight: FontWeight.bold
                    ),),
                    GestureDetector(
                      onTap: (){},
                      child:const Text('See all',style: TextStyle(color: Colors.green,
                        fontSize: 16,fontWeight: FontWeight.bold
                      ),),
                    )
                  ],
                ),
                Container(
                  margin:const EdgeInsets.symmetric(vertical: 8),
                  height: maxHeight*.3,
                  child: Obx(() =>ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: castController.castList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal:5,),
                            child: GestureDetector(
                              onTap: (){
                  
                              },
                              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                   Container(
                                    height: maxHeight*.2,width: maxWidth*.3,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(fit: BoxFit.fill,
                                        image:NetworkImage(ogBasUrl+castController.castList[index].profilePath.toString(),)),
                                      
                                    ),
                                   ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal:3,vertical: 3),
                                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(castController.castList[index].name.toString()),
                                        const SizedBox(height: 5,),
                                        SizedBox(width: maxWidth*.3,
                                      child: Text(castController.castList[index].character.toString(),maxLines: 2,)),
                                      ],
                                    ),
                                  )
                                  ],
                              ),
                            ),
                          );
                        },
                      )),
                ),
                const Text('Similar movies',style: TextStyle(
                  fontSize: 18,fontWeight: FontWeight.bold
                ),),
                Container(
                  height: maxHeight*.3,
                  margin:const EdgeInsets.symmetric(vertical: 8),
                  child: Obx(() => ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: similarController.similarList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal:5,vertical: 5),
                            child:SizedBox(
                              width: maxWidth*.3,
                              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Image.network(baseUrl+similarController.similarList[index].posterPath.toString(),
                                      height: maxHeight*.22,),
                                      Text(similarController.similarList[index].title.toString(),maxLines: 2,),
                                      Text(similarController.similarList[index].releaseDate.toString().substring(0,4)),
                                      ],
                                  ),
                            )
                          );
                        },
                      ) ),
                ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}