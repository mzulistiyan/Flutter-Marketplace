import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:shamo_front_end/models/user_model.dart';
import 'package:shamo_front_end/services/auth_service.dart';

class AuthProvider with ChangeNotifier {
  late UserModel _user;
  UserModel get user => _user;

  set user(UserModel user) {
    _user = user;
    notifyListeners();
  }

  Future<bool> register({
    String name = '',
    String username = '',
    String email = '',
    String password = '',
  }) async {
    try {
      UserModel user = await AuthService().register(
        name: name,
        email: email,
        username: username,
        password: password,
      );

      _user = user;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> login({
    String email = '',
    String password = '',
  }) async {
    try {
      UserModel user = await AuthService().login(
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
