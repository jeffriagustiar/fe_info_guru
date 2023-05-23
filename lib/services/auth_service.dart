import 'dart:convert';

import 'package:fe_info_guru/models/user/user_model.dart';
import 'package:fe_info_guru/share/theme.dart';
import 'package:http/http.dart' as http;
import 'package:sp_util/sp_util.dart';

class AuthService{
  final String baseUrl = url;

  Future<UserModel> login({
    required String nip,
    required String password,
  }) async {
    var url = Uri.parse('$baseUrl/loginGuru');
    var headers = {'Content-Type' : 'application/json'};
    var body = jsonEncode({
      'nip' : nip,
      'password' : password,
    });

    var response = await http.post(
      url, 
      headers: headers,
      body: body
    );

    // print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      UserModel user = UserModel.fromJson(data['user']);
      // ignore: prefer_interpolation_to_compose_strings
      user.api_token = 'Bearer ' + data['access_token'];
      SpUtil.putInt('a', 1);
      // ignore: prefer_interpolation_to_compose_strings
      SpUtil.putString('token', 'Bearer ' + data['access_token']);
      SpUtil.putString('nama', data['nama']);
      SpUtil.putString('kelamin', data['kelamin']);
      SpUtil.putString('nip', user.login!);
      SpUtil.putInt('level', user.level ?? 1); 
      SpUtil.putString('kelola', user.kelola ?? "guru"); 

      return user;
    }else{
      throw Exception('Gagal Login');
      // throw Exception(Error());
    }
  }

  Future<UserModel> logout({
    required String nip,
    required String token
  }) async {
    var url = Uri.parse('$baseUrl/logoutGuru');
    var headers = {
      'Content-Type': 'application/json',
      'Authorization' : token
    };
    var body = jsonEncode({
      'nip': nip,
    });

    var response = await http.post(
      url,
      headers: headers,
      body: body,
    );

    // ignore: avoid_print
    print(response.body);

    if (response.statusCode == 200) {
      SpUtil.putInt('a', 0);
      SpUtil.putString('token', 'Bearer ');
      SpUtil.putString('nip', '');
      SpUtil.putInt('level', 0); 
      SpUtil.putString('kelola', ''); 
      throw Exception('Berhasil Logout');
    } else {
      throw Exception('Gagal Logout');
    }
  }


}