import 'package:fe_info_guru/models/catatan/kategori_model2.dart';
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


  List<KategoriModel2> _listKategori = [];

  List<KategoriModel2> get listKategori => _listKategori;

  set listKategori(List<KategoriModel2> listKategori){
    _listKategori = listKategori;
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

  //Ambil List Kategori untuk List
  Future<void> getListKategori(String jenis) async{
    _listKategori = [];
    try {
      List<KategoriModel2> listKategori = await SiswaService().getListKategori(jenis);
      _listKategori = listKategori; 
      
    } catch (e) {
      // ignore: avoid_print
      print(e); 
    }
  }

  //Add Kategori
  Future<bool> addKategori(String nama, String kategori, String ket) async {
    try {
      await SiswaService().addKategori(nama: nama, kategori: kategori, ket: ket);
      return true;
    } catch (e) {
      // print(e);
      return false;
    }
  }


}