import 'dart:convert';

import 'package:fe_info_guru/share/theme.dart';
import 'package:http/http.dart' as http;
import 'package:sp_util/sp_util.dart';

class SiswaService{
  final String baseUrl = url;
  final String bearrerToken = SpUtil.getString('token').toString();

  
  //Ambil Data Semua Siswa2
  Future<List<dynamic>> getAllSiswa2() async{
    var url = Uri.parse('$baseUrl/dataSemuaSiswa');

    var headers = {
      'Content-Type': 'application/json',
      'Authorization' : bearrerToken
    };

    var response = await http.get(
      url,
      headers: headers
    );

    // ignore: avoid_print
    // print((response.body));
    // ignore: avoid_print
    // print("bisa mapel nilai harian");

    if (response.statusCode == 200) {
      List  data = jsonDecode(response.body)['data'];
      return data;
    } else {
      throw Exception("Gagal Ambil data Siswa");
    }
  }
}