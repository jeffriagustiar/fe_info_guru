import 'package:fe_info_guru/models/catatan/kategori_model.dart';
import 'package:fe_info_guru/services/catatan_service.dart';
import 'package:flutter/material.dart';

class CatatanProvider with ChangeNotifier{
  
  List<KategoriModel> _infoCatatan = [];

  List<KategoriModel> get infoCatatan => _infoCatatan;

  set infoCatatan(List<KategoriModel> infoCatatan){
    _infoCatatan = infoCatatan;
    notifyListeners();
  }










  //Ambil Data Info Tatatertib atau Catatan
  Future<void> getInfoCatatan(String jenis) async{
    _infoCatatan = [];
    try {
      List<KategoriModel> infoCatatan = await CatatanService().getInfoCatatan(jenis);
      _infoCatatan = infoCatatan; 
    } catch (e) {
      // ignore: avoid_print
      print(e); 
    }
  }
}