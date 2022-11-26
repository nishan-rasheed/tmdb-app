import 'package:carousel_slider/carousel_slider.dart';
import 'package:film_app/constants/api_constants.dart';
import 'package:film_app/sevices/controller/trending_controller.dart';
import 'package:film_app/view/screens/home/show_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({Key? key}) : super(key: key);
   
   TrendingController controller = Get.put(TrendingController());
  @override
  Widget build(BuildContext context) {
    final maxHeight = MediaQuery.of(context).size.height;
    final maxWidth = MediaQuery.of(context).size.width;
    return Scaffold(
     body: SafeArea(
       child: Padding(
         padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
         child: ListView(
           children: [
             Obx((){
              if (controller.isLoading.value) {
                return const Center(
                  child: CircularProgressIndicator());
              }else{
             return CarouselSlider.builder(
             itemCount:controller.topRatedList.length>5?5:controller.topRatedList.length,
             options: CarouselOptions(
               height: maxHeight*.25,
               autoPlay: true,
               viewportFraction: 0.8,
               aspectRatio: 16/9,
               enlargeCenterPage: true,
             ),
             itemBuilder: (context, index, realIndex) => 
             Image.network(ogBasUrl+controller.trendingList[index].backdropPath.toString(),
             fit: BoxFit.fill,width: 300,),
                    );}}),
             const Padding(
               padding:EdgeInsets.symmetric(vertical: 10),
               child: Text('Top Rating',style: TextStyle(
                fontSize: 20,fontWeight: FontWeight.bold
               ),),
             ),
             SizedBox(height: maxHeight*.3,
               child:         
               Obx(()=> ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                     itemCount:controller.trendingList.length,
                     itemBuilder: (BuildContext context, int index) {
                       return GestureDetector(
                          onTap: () {
                          Get.to(ShowDemo(
                            poster: baseUrl+controller.trendingList[index].posterPath.toString(),
                            title:controller.trendingList[index].title.toString(),
                            year: controller.trendingList[index].releaseDate.toString().substring(0,4),
                            backDrop:ogBasUrl+controller.trendingList[index].backdropPath.toString(),
                            plot:controller.trendingList[index].overview.toString(),
                            id:controller.trendingList[index].id.toString(),
                            character:'bn',
                            actor: 'bnm',
                            actorImage: 'bnm',
                            genre: 'ghjn',
                            rating: 'bnm',
                          ));
                          //  Get.to(const ShowDetailScreen());
                        },
                         child: Container(width: maxWidth*.3,
                          margin:const EdgeInsets.symmetric(horizontal: 5),
                          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(height: maxHeight*.2,
                                decoration: BoxDecoration(
                                  image: DecorationImage(fit: BoxFit.fill,
                                    image:NetworkImage(baseUrl+controller.trendingList[index].posterPath.toString(),
                                    ))
                                ),
                              ),
                               Text(controller.trendingList[index].title.toString(),maxLines: 2,),
                               Text(controller.trendingList[index].releaseDate.toString().substring(0,4)),
                              Row(
                                children: const [
                                  Icon(Icons.star_purple500_sharp,color: Color(0xffb6ea21),),
                                  SizedBox(width: 10,),
                                  Text('8.7'),
                                ],
                              )
                            ],
                          ),
                         ),
                       );
                     },
                   )),
             ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text('Recommended',style: TextStyle(
                fontSize: 20,fontWeight: FontWeight.bold
               ),),
            ),
             Obx(() => GridView.builder(
                  physics:const ScrollPhysics(),
                  shrinkWrap: true,
                   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                     crossAxisCount: 2,
                     childAspectRatio: 4/7,
                     mainAxisSpacing: 10,
                     crossAxisSpacing: 10,
                   ),
                   itemCount:controller.topRatedList.length,
                   itemBuilder: (BuildContext context, int index) {
                     return GestureDetector(
                      onTap: (){
                        Get.to(ShowDemo(
                            poster: baseUrl+controller.topRatedList[index].posterPath.toString(),
                            title:controller.topRatedList[index].title.toString(),
                            year: controller.topRatedList[index].releaseDate.toString().substring(0,4),
                            backDrop:ogBasUrl+controller.topRatedList[index].backdropPath.toString(),
                            plot:controller.topRatedList[index].overview.toString(),
                            id:controller.topRatedList[index].id.toString(),
                            character:'bn',
                            actor: 'bnm',
                            actorImage: 'bnm',
                            genre: 'ghjn',
                            rating: 'bnm',
                          ));
                      },
                       child: Container(width: maxWidth*.3,decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey
                        )
                       ),
                          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(height: maxHeight*.28,
                                decoration:BoxDecoration(
                                  image: DecorationImage(fit: BoxFit.fill,
                                    image:NetworkImage(baseUrl+controller.topRatedList[index].posterPath.toString(),
                                    ))
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 2),
                                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(controller.topRatedList[index].title.toString(),maxLines: 2,),
                                    const SizedBox(height: 3,),
                                 Text('( ${controller.topRatedList[index].releaseDate.toString().substring(0,4)} )'),
                                Row(mainAxisAlignment: MainAxisAlignment.end,
                                  children: const [
                                    Icon(Icons.star_purple500_sharp,color: Color(0xffb6ea21),),
                                    SizedBox(width: 10,),
                                    Text('8.7'),
                                  ],
                                )
                                  ],
                                ),
                              )
                            ],
                          ),
                         ),
                     );
                   },
                 )),
           ],
         ),
       ),
     ),
    );
  }
}