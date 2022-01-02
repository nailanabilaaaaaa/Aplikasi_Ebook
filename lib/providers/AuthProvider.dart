import 'package:ebook_app/models/User.dart';
import 'package:ebook_app/services/auth_service.dart';
import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  late User _user;

  User get user => _user;

  set user(User user) {
    _user = user;
    notifyListeners();
  }

  Future<bool> register({
    required String name,
    required String email,
    required String password,
    required String passwordConfirm,
    required String deviceName
  }) async {
    try {
      User user = await AuthService().register(
        name: name,
        email: email,
        password: password,
        passwordConfirm: passwordConfirm,
        deviceName: deviceName
      );

      _user = user;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> login({
    required String email,
    required String password,
  }) async {
    try {
      User user = await AuthService().login(
        email: email,
        password: password,
      );

      _user = user;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}