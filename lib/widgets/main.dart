import 'package:complete_project/pages/home_page.dart';
import 'package:complete_project/pages/home_page_with_fb.dart';
import 'package:complete_project/pages/login_page.dart';
import 'package:complete_project/utills/Constans.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future main() async{
  WidgetsFlutterBinding.ensureInitialized();

  Constans.preferences = await SharedPreferences.getInstance();

  runApp(
    MaterialApp(
      title: "Awesome App",
      home: Constans.preferences.getBool("loggedIn") == true
        ?HomePageFB()
        :LoginPage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.purple),
      routes:{
      "/login": (context) => LoginPage(),
        "/home" : (context) => HomePage(),
        "/homefb" : (context) => HomePageFB()
      }
    ),
  );
}



