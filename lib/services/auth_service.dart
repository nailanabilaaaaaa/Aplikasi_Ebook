import 'dart:convert';
import 'package:ebook_app/models/User.dart';
import 'package:http/http.dart' as http;

class AuthService {
  String baseUrl = 'http://192.168.1.6/api/';

  Future<User> register({
    required String name,
    required String email,
    required String password,
    required String passwordConfirm,
    required String deviceName,
  }) async {
    var url = Uri.parse(baseUrl + 'register');
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({
      'name' : name,
      'email': email,
      'password': password,
      'password_confirmation' : passwordConfirm,
      'device_name': deviceName,
    });

    var response = await http.post(
      url,
      headers: headers,
      body: body,
    );

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      User user = User.fromJson(data['user']);
      user.token = 'Bearer ' + data['access_token'];

      return user;
    } else {
      throw Exception('Gagal Register');
    }
  }

  Future<User> login({
    required String email,
    required String password,
  }) async {
    var url = Uri.parse(baseUrl + 'login');
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({
      'email': email,
      'password': password,
    });

    var response = await http.post(
      url,
      headers: headers,
      body: body,
    );

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      User user = User.fromJson(data['user']);
      user.token = 'Bearer ' + data['access_token'];

      return user;
    } else {
      throw Exception('Gagal Login');
    }
  }
}