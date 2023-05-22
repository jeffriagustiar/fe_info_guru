import 'package:fe_info_guru/models/user/user_model.dart';
import 'package:fe_info_guru/services/auth_service.dart';
import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier{
  late UserModel _user;

  UserModel get user => _user;

  set user(UserModel user) {
    _user = user;
    notifyListeners();
  }

  Future<bool> login({
    required String nip,
    required String password,
  }) async {
    
    try {
      UserModel user = await AuthService().login(
        nip: nip, 
        password: password
      );

      _user = user;
      return true;
    } catch (e) {
      // ignore: avoid_print
      print(e); 
      return false;
    }

  }

  Future<bool> logout({
    required String nip,
    required String token,
  }) async {
    try {
      UserModel user = await AuthService().logout(
        nip: nip, 
        token: token
      );

      _user = user;
      return true;
    } catch (e) {
      // ignore: avoid_print
      print(e);
      return false;
    }
  }
}