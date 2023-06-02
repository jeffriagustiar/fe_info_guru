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

  //Ambil Data Semua Kategori
  Future<List<dynamic>> getAllKategori(String jenis) async{
    var url = Uri.parse('$baseUrl/dataSemuaKategori?jenis=$jenis');

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
      throw Exception("Gagal Ambil data Kategori");
    }
  }

  //Ambil Data Semua Jenis
  Future<List<dynamic>> getAllJenis(String jenis) async{
    var url = Uri.parse('$baseUrl/dataSemuaJenis?kategori=$jenis');

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
      throw Exception("Gagal Ambil data Kategori");
    }
  }

  //Laporkan Siswa
  Future laporkanSiswa({
    required String nis,
    required String idCtt,
    required String ket,
    required String poin,
  }) async {
    var url = Uri.parse('$baseUrl/laporkanSiswa');
    var headers = {
      'Content-Type': 'application/json',
      'Authorization' : bearrerToken
    };
    var body = jsonEncode({
      'id_ctt' : idCtt,
      'nis' : nis,
      'ket' : ket,
      'point' : poin,
    });

    var response = await http.post(
        url,
        headers: headers,
        body: body
    );

    // print((response.body));
    // print((body));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      // print(data);
      return data;
    } else {
      throw Exception('Gagal Ambil Buat Laporan');
    }
  }


}