import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:scribble_share/services/login_service.dart';

class LoginProvider extends ChangeNotifier{
  final loginService = LoginService();
  String? _token;
  String? _userId;

  String? get token => _token;
  String? get userId => _userId;

  Future<String> registerUser(String username, String email, String password) async {
    try{
      final response = await loginService.registerUser(username, email, password);
      return response.body;
    }
    catch (err){
      return err.toString();
    }
  }

  Future<String> loginUser(BuildContext context, String email, String password) async {
    try{
      final response = await loginService.loginUser(email, password);
      if(response.statusCode == 200){
        _token = jsonDecode(response.body)['token'];
        _userId = jsonDecode(response.body)['user'];
        print(_token);
        notifyListeners();
        Navigator.pushNamed(context, "/home");
        return "Success";
      }
      return "Error";
    }
    catch (err){
      return err.toString();
    }
  }

  void handleLogout(){
    _token = null;
    notifyListeners();
  }
}