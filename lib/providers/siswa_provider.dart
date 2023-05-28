import 'package:fe_info_guru/services/siswa_service.dart';
import 'package:flutter/material.dart';

class SiswaProvider with ChangeNotifier{

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
}