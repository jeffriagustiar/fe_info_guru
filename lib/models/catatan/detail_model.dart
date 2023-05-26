class DetailModel{
  late int? replid;
  late int? idKategori;
  late String? namaCtt;
  late int? point;
  late String? ket;
  late String? ts;

  DetailModel({
    this.replid,
    this.idKategori,
    this.namaCtt,
    this.point,
    this.ket,
    this.ts,
  });

  factory DetailModel.fromJson(Map<String, dynamic> json){
    return DetailModel(
      replid: json['replid'],
      idKategori: json['id_kategori'],
      namaCtt: json['nama_ctt'],
      point: json['point'],
      ket: json['ket'],
      ts: json['ts']
    );
  }

  Map<String, dynamic> toJson(){
    return{
      "replid": replid,
      "id_kategori": idKategori,
      "nama_ctt": namaCtt,
      "point": point,
      "ket": ket,
      "ts": ts
    };
  }
}