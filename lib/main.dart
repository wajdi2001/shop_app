import 'package:flutter/material.dart';
import 'package:store_app/features/Login/ui/login_page.dart';
import 'package:store_app/features/cart/ui/cart.dart';
import 'package:store_app/features/favorite/favorite.dart';
import 'package:store_app/features/home/ui/home.dart';
import 'package:store_app/features/leading/ui/leadingPage.dart';

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
        primaryColor: Color.fromARGB(1, 28, 218, 222),
      ),
      home: LoginPage(),
      
    );
  }
}
