import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:scribble_share/constants/api_constants.dart';

class LoginService {
  Future<http.Response> registerUser(
      String username, String email, String password) async {
    try {
      final Map<String, dynamic> data = {
        'name': username,
        "email": email,
        "password": password,
      };

      final String body = jsonEncode(data);
      final http.Response response = await http.post(
        Uri.parse(ApiConstants.registerUser),
        headers: {"Content-Type": "application/json"},
        body: body, 
      );

      return response;
    } on Exception catch (e) {
      print(e);
      throw Exception(e);
    }
  }

  Future<http.Response> loginUser(String email, String password) async {
    try {
      final Map<String, dynamic> data = {
        "email" : email,
        "password" : password
      };
      final String body = jsonEncode(data);
      final http.Response response = await http.post(Uri.parse(ApiConstants.loginUser),
        headers: {"Content-Type": "application/json"},
        body: body,
      );
      return response;
    }
    on Exception catch(e){
      print(e);
      throw Exception(e);
    }
  }
}
