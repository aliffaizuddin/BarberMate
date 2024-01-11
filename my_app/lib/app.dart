import 'package:flutter/material.dart';
import 'package:my_app/Login/Features/splashScreen/splash_screen.dart';


class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MySplashScreen(),
    );
  }
}