
import 'package:film_app/view/screens/navigation/navigation_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xff242A32),
        ),
        scaffoldBackgroundColor: Color(0xff242A32),
        textTheme: TextTheme(
          bodyMedium: TextStyle(color: Colors.grey.shade300)
        ),
        primarySwatch: Colors.green,
      ),
      home: NavigationScreen()
    );
  }
}

