import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> fetchPost() async {
  final response = await http.post(
      Uri.parse('http://192.168.0.179:8084/api/v1/token'),
      body: {"username": "admin", "password": "admin123"});
  final responseJson = json.decode(response.body);

  SharedPreferences prefs = await SharedPreferences.getInstance();

  await prefs.setString('token', responseJson['access_token']);
  return responseJson;
}
