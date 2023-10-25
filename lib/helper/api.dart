import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Api {
  Future<dynamic> get({required String url, @required String? token}) async {
    Map<String, String> heeaders = {};
    /* if (token != null) {
      heeaders.addAll({
        'Authorization': 'Bearer $token',
      });
    }*/
    http.Response response = await http.get(
      Uri.parse(url),
    );

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception('error response:${response.statusCode}');
    }
  }

  Future<dynamic> post(
      {required url, @required dynamic body, @required String? token}) async {
    Map<String, String> heeaders = {};
    if (token != null) {
      heeaders.addAll({
        'Authorization': 'Bearer $token',
      });
    }
    http.Response response = await http.post(
      Uri.parse('https://fakestoreapi.com/products'),
      body: body,
      headers: heeaders,
    );
    Map<String, dynamic> data = jsonDecode(response.body);
    return data;
  }

  Future<dynamic> put(
      {required url, @required dynamic body, @required dynamic token}) async {
    Map<String, String> heeaders = {};
    heeaders.addAll({'Content-Type': 'application/x-www-form-urlencoded'});

    if (token != null) {
      heeaders.addAll({
        'Authorization': 'Bearer $token',
      });
    }
    http.Response response = await http.post(
      Uri.parse('https://fakestoreapi.com/products'),
      body: body,
      headers: heeaders,
    );
    Map<String, dynamic> data = jsonDecode(response.body);
    return data;
  }
}
