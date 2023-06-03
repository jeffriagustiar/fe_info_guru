
import 'package:fe_info_guru/models/catatan/detail_model.dart';

class KategoriModel2{
  late int? replid;
  late String? namaKategori;
  late String? kategori;
  late String? ket;
  late String? ts;

  KategoriModel2({
    this.replid,
    this.namaKategori,
    this.kategori,
    this.ket,
    this.ts,
  });

  factory KategoriModel2.fromJson(Map<String, dynamic> json){
    return KategoriModel2(
      replid:  json['replid'],
      namaKategori: json['nama_kategori'],
      kategori: json['kategori'],
      ket: json['ket'],
      ts: json['ts'],
    );
  }

  Map<String, dynamic> toJson(){
    return{
      'replid': replid,
      'nama_kategori': namaKategori,
      'kategori': kategori,
      'ket': ket,
      'ts': ts,
    };
  }
}