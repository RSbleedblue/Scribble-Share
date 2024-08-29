import 'package:flutter/material.dart';
import 'package:scribble_share/views/auth/login_screen.dart';
import 'package:scribble_share/views/welcome.dart';

Route<dynamic> generateRoute(RouteSettings settings){
  switch(settings.name){
    case '/login':
      return MaterialPageRoute(builder: (context) => const LoginScreen());
    default : 
        return MaterialPageRoute(builder: (context) => const Welcome());
  }
}