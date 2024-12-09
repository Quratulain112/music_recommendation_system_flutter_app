import 'package:flutter/material.dart';
import 'package:music_app/screens/home_screen.dart';
import 'package:music_app/screens/login_screen.dart';
import 'package:music_app/screens/register_sceen.dart';
import 'package:music_app/screens/splash_screen.dart';
import 'package:music_app/screens/start_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/sp",
      routes: {
        "/sp": (context) => SplashScreen(),
        "/ss": (context) => StartScreen(),
        "/rg": (contxt) => RegisterScreen(),
        "/hm": (context) => HomeScreen(),
        "/lg": (context) => LoginScreen(),
      },
    );
  }
}
