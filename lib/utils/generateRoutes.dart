import 'package:flutter/material.dart';
import 'package:scribble_share/views/auth/login_screen.dart';
import 'package:scribble_share/views/landing/home.dart';
import 'package:scribble_share/views/welcome.dart';

Route<dynamic> generateRoute(RouteSettings settings){
  switch(settings.name){
    case '/login':
      return MaterialPageRoute(builder: (context) => const LoginScreen());
    case '/home' :
      return MaterialPageRoute(builder: (context) => const Home());
    default : 
        return MaterialPageRoute(builder: (context) => const Welcome());
  }
}