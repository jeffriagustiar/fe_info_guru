class ProfileModel{
  late int? replid;
  late String? nip;
  late String? nrp;
  late String? nuptk;
  late String? nama;
  late String? panggilan;
  late String? gelarawal;
  late String? gelarakhir;
  late String? gelar;
  late String? tmplahir;
  late String? tgllahir;
  late String? agama;
  late String? suku;
  late String? noid;
  late String? alamat;
  late String? telpon;
  late String? handphone;
  late String? email;
  late String? bagian;
  late String? nikah;
  late String? keterangan;
  late int? aktif;
  late String? kelamin;
  late String? pinpegawai;
  late String? mulaikerja;
  late String? status;
  late String? ketnonaktif;
  late String? pensiun;

  ProfileModel({
    this.replid,
    this.nip,
    this.nrp,
    this.nuptk,
    this.nama,
    this.panggilan,
    this.gelarawal,
    this.gelarakhir,
    this.gelar,
    this.tmplahir,
    this.tgllahir,
    this.agama,
    this.suku,
    this.noid,
    this.alamat,
    this.telpon,
    this.handphone,
    this.email,
    this.bagian,
    this.nikah,
    this.keterangan,
    this.aktif,
    this.kelamin,
    this.pinpegawai,
    this.mulaikerja,
    this.status,
    this.ketnonaktif,
    this.pensiun,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json){
    return ProfileModel(
      replid : json['replid'],
      nip : json['nip'],
      nrp : json['nrp'],
      nuptk : json['nuptk'],
      nama : json['nama'],
      panggilan : json['panggilan'],
      gelarawal : json['gelarawal'],
      gelarakhir : json['gelarakhir'],
      gelar : json['gelar'],
      tmplahir : json['tmplahir'],
      tgllahir : json['tgllahir'],
      agama : json['agama'],
      suku : json['suku'],
      noid : json['noid'],
      alamat : json['alamat'],
      telpon : json['telpon'],
      handphone : json['handphone'],
      email : json['email'],
      bagian : json['bagian'],
      nikah : json['nikah'],
      keterangan : json['keterangan'],
      aktif : json['aktif'],
      kelamin : json['kelamin'],
      pinpegawai : json['pinpegawai'],
      mulaikerja : json['mulaikerja'],
      status : json['status'],
      ketnonaktif : json['ketnonaktif'],
      pensiun : json['pensiun'],
    );
  }

  Map<String, dynamic> toJson(){
    return {
      'replid' : replid,
      'nip' : nip,
      'nrp' : nrp,
      'nuptk' : nuptk,
      'nama' : nama,
      'panggilan' : panggilan,
      'gelarawal' : gelarawal,
      'gelarakhir' : gelarakhir,
      'gelar' : gelar,
      'tmplahir' : tmplahir,
      'tgllahir' : tgllahir,
      'agama' : agama,
      'suku' : suku,
      'noid' : noid,
      'alamat' : alamat,
      'telpon' : telpon,
      'handphone' : handphone,
      'email' : email,
      'bagian' : bagian,
      'nikah' : nikah,
      'keterangan' : keterangan,
      'aktif' : aktif,
      'kelamin' : kelamin,
      'pinpegawai' : pinpegawai,
      'mulaikerja' : mulaikerja,
      'status' : status,
      'ketnonaktif' : ketnonaktif,
      'pensiun' : pensiun,
    };
  }
}