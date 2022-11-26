import 'package:film_app/view/screens/home/tabs/about_tab.dart';
import 'package:film_app/view/screens/home/tabs/cast_tab.dart';
import 'package:flutter/material.dart';

class ShowDetailScreen extends StatelessWidget {
  const ShowDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final maxHeight = MediaQuery.of(context).size.height;
    final maxWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: DefaultTabController(
        length: 3,
        child: NestedScrollView(
          headerSliverBuilder:(context, innerBoxIsScrolled) => [
            SliverToBoxAdapter(
              child:SafeArea(
                child: Column(
                  children: [
                    Stack(clipBehavior: Clip.none,
                  children: [
                    Container(
                    height: maxHeight*.3,width: maxWidth,
                    decoration:const BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage('https://c4.wallpaperflare.com/wallpaper/763/710/546/spiderman-no-way-home-spiderverse-superhero-movies-digital-hd-wallpaper-preview.jpg'))
                    ),
                    ),
                    Positioned(
                      top: maxHeight*.2,
                      child: Container(
                        margin: EdgeInsets.only(left:maxWidth*.08),
                        height: maxHeight*.2,width: maxWidth*.3,
                        decoration: BoxDecoration(
                        image:const DecorationImage(fit: BoxFit.fitHeight,
                        image: NetworkImage('https://www.pinkvilla.com/imageresize/spider_man_no_way_home_0.jpg?width=752&t=pvorg')),           
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    )
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(left: maxWidth*.3,top: maxHeight*.02),
                  width: maxWidth*.5,
                  child:const Text('Spiderman No Way Home',style: TextStyle(
                    fontSize: 18,fontWeight: FontWeight.bold
                  ),),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: maxHeight*.05,horizontal: maxWidth*.1),
                  child: SizedBox(height:20,
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children:const [
                        // Icon(Icons.calendar_month,color: Colors.white,),
                        Text('Action'),
                        VerticalDivider(color: Colors.white,),
                        // Icon(Icons.timelapse_outlined,color: Colors.white,),
                        Text('Thriller'),
                        VerticalDivider(color: Colors.white,),
                        //Icon(Icons.movie,color: Colors.white,),
                        Text('Drama'),
                      ],
                    ),
                  ),
                ),
                TabBar(
                  padding: EdgeInsets.symmetric(horizontal: maxWidth*.03),
                  tabs:const [
                  Text('About'),
                  Text('Trailer'),
                  Text('Cast'),
                ]),
                  ],
                ),
              ) ,
            )
          ],
          body:const TabBarView(children:[
                  AboutTab(),
                  Text('hgbnm,'),
                  CastTab(),
                ]),
        ),
      ),
    );
  }
}