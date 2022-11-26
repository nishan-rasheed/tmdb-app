import 'package:film_app/sevices/controller/navigation_controller.dart';
import 'package:film_app/view/screens/home/homescreen.dart';
import 'package:film_app/view/screens/profile/screens/profile_screen.dart';
import 'package:film_app/view/screens/search/screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationScreen extends StatelessWidget {
  
    NavigationController controller = Get.put(NavigationController());
  NavigationScreen({Key? key}) : super(key: key);

 
    
  List pages =  [
   HomeScreen(),
   const SearchScreen(),
   const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Obx(() => Center(child: pages.elementAt(controller.selectedIndex.value),)
      ),
      bottomNavigationBar:Obx(() => BottomNavigationBar(
                backgroundColor: Color(0xff242A32),
                items: const[
                  BottomNavigationBarItem(icon: Icon(Icons.home,color: Colors.white,),label: 'home'),
                  BottomNavigationBarItem(icon: Icon(Icons.search,color: Colors.white,),label: 'search'),
                  BottomNavigationBarItem(icon: Icon(Icons.person,color: Colors.white,),label: 'profile'),
                ],
                currentIndex:controller.selectedIndex.value,
                onTap: (index){
                 controller.onChanged(index);
                },
                )
      )
    );
  }
}