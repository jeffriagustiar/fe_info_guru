
import 'package:fe_info_guru/models/catatan/detail_model.dart';

class KategoriModel{
  late int? replid;
  late String? namaKategori;
  late String? kategori;
  late String? ket;
  late String? ts;
  late List<DetailModel>? detail;

  KategoriModel({
    this.replid,
    this.namaKategori,
    this.kategori,
    this.ket,
    this.ts,
    this.detail,
  });

  factory KategoriModel.fromJson(Map<String, dynamic> json){
    return KategoriModel(
      replid:  json['replid'],
      namaKategori: json['nama_kategori'],
      kategori: json['kategori'],
      ket: json['ket'],
      ts: json['ts'],
      detail: json['detail']
        .map<DetailModel>((gallery) => DetailModel.fromJson(gallery))
        .toList()
    );
  }

  Map<String, dynamic> toJson(){
    return{
      'replid': replid,
      'nama_kategori': namaKategori,
      'kategori': kategori,
      'ket': ket,
      'ts': ts,
      'detail': detail?.map((detail2) => detail2.toJson()).toList(),
    };
  }
}