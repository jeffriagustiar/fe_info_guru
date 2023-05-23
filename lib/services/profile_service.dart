import 'dart:convert';

import 'package:fe_info_guru/models/profile/profile_model.dart';
import 'package:fe_info_guru/share/theme.dart';
import 'package:http/http.dart' as http;
import 'package:sp_util/sp_util.dart';

class ProfileService{
  final String baseUrl = url;
  final String bearrerToken = SpUtil.getString('token').toString();

  //ambil data Profile Guru
  Future<ProfileModel> getProfile() async{
    var url = Uri.parse('$baseUrl/dataGuru');

    var headers = {
      'Content-Type': 'application/json',
      'Authorization' : bearrerToken
    };

    var response = await http.get(
      url,
      headers: headers
    );

    // ignore: avoid_print
    print(response.body);
    // print("bisa siswa");

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body)['data'];
      final profile = ProfileModel.fromJson(data);

      return profile;
    } else {
      throw Exception("Gagal Ambil data profile Guru");
    }
  }
}