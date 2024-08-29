import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:scribble_share/services/login_service.dart';

class LoginProvider extends ChangeNotifier{
  final loginService = LoginService();
  String? _token;

  String? get token => _token;

  Future<String> registerUser(String username, String email, String password) async {
    try{
      final response = await loginService.registerUser(username, email, password);
      return response.body;
    }
    catch (err){
      return err.toString();
    }
  }

  Future<String> loginUser(String email, String password) async {
    try{
      final response = await loginService.loginUser(email, password);
      if(response.statusCode == 200){
        _token = jsonDecode(response.body)['token'];
        print(_token);
        notifyListeners();
        return jsonDecode(response.body)['success'];
      }
      return response.body;
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