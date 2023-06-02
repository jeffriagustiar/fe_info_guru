import 'package:fe_info_guru/models/catatan/list_catatan_model.dart';
import 'package:fe_info_guru/services/siswa_service.dart';
import 'package:flutter/material.dart';

class SiswaProvider with ChangeNotifier{

  List<ListCatatanModel> _listLaporan = [];

  List<ListCatatanModel> get listLaporan => _listLaporan;

  set listLaporan(List<ListCatatanModel> listLaporan){
    _listLaporan = listLaporan;
    notifyListeners();
  }









  //Laporkan Siswa
  Future<bool> laporkanSiswa(String nis, String idCtt, String ket, String poin) async {
    try {
      await SiswaService().laporkanSiswa(nis: nis, idCtt: idCtt, ket: ket, poin: poin);
      return true;
    } catch (e) {
      // print(e);
      return false;
    }
  }

  //Ambil List Laporan
  Future<void> getListLaporan() async{
    _listLaporan = [];
    try {
      List<ListCatatanModel> listLaporan = await SiswaService().getListLaporan();
      _listLaporan = listLaporan; 
      
    } catch (e) {
      // ignore: avoid_print
      print(e); 
    }
  }

  //Validasi Laporan
  Future<bool> validasiLaporan(String id, String acc) async {
    try {
      await SiswaService().validasiLaporan(id: id, acc: acc);
      return true;
    } catch (e) {
      // print(e);
      return false;
    }
  }


}