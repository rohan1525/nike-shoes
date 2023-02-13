import 'package:flutter/material.dart';
import 'package:nike_shoes/ItemPage.dart';
import 'HomePage.dart';
import 'LoginPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => LoginPage(),
        "homePage": (context) => HomePage(),
        "itemPage": (context) => ItemPage(),
      },

    );
  }
}