class ListCatatanModel{
  late String? replid;
  late String? nama;
  late String? kategori;
  late String? jenis;
  late String? kelas;
  late String? point;
  late String? acc;
  late String? ket;
  late String? nip;
  late String? tanggal;

  ListCatatanModel({
    this.replid,
    this.nama,
    this.kategori,
    this.jenis,
    this.kelas,
    this.point,
    this.acc,
    this.ket,
    this.nip,
    this.tanggal
  });

  factory ListCatatanModel.fromJson(Map<String, dynamic> json){
    return ListCatatanModel(
      replid: json['replid'].toString(),
      nama: json['nama'],
      kategori: json['kategori'],
      jenis: json['jenis'],
      kelas: json['kelas'],
      point: json['point'].toString(),
      acc: json['acc'].toString(),
      ket: json['ket'],
      nip: json['nip'],
      tanggal: json['tanggal'],
    );
  }
}