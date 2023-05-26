import 'dart:convert';

import 'package:fe_info_guru/models/catatan/kategori_model.dart';
import 'package:fe_info_guru/share/theme.dart';
import 'package:http/http.dart' as http;
import 'package:sp_util/sp_util.dart';

class CatatanService{
  final String baseUrl = url;
  final String bearrerToken = SpUtil.getString('token').toString();

  //Ambil Data Info Tatatertib atau Catatan
  Future<List<KategoriModel>> getInfoCatatan(String jenis) async{
    var url = Uri.parse('$baseUrl/catatan?jenis=$jenis');

    var headers = {
      'Content-Type': 'application/json',
      'Authorization' : bearrerToken
    };

    var response = await http.get(
      url,
      headers: headers
    );

    // ignore: avoid_print
    print((response.body));
    // ignore: avoid_print
    // print("bisa mapel nilai harian");

    if (response.statusCode == 200) {
      List  data = jsonDecode(response.body)['data'];
      // ignore: non_constant_identifier_names
      List<KategoriModel> infoCatatan = [];

      for (var item in data) {
        infoCatatan.add(KategoriModel.fromJson(item));
      }
      return infoCatatan;
    } else {
      throw Exception("Gagal Ambil data info Catatan");
    }
  }

  Future<List<dynamic>> test()async{
    var response = await http.get(Uri.parse(
      "https://dev.farizdotid.com/api/daerahindonesia/provinsi"));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
                
                                      // setState(() {
                                      //   _get = 
                                      //   //siswa.siswaAll.map((sis) => sis.nama).toList(); 
                                      //   // infoCatatanSiswa.infoCatatan.map((info) => info.namaKategori).toList();
                                      //   data['provinsi'];
                                      // });
        // return data;
        return data['provinsi'];
      }else {
        throw Exception('Failed to fetch data');
      }
  }
}