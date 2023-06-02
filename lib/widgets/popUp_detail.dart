// ignore: file_names
import 'package:fe_info_guru/share/theme.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PopUpDetail extends StatelessWidget {
  String namaS;
  String kelas;
  String kategori;
  String jenis;
  String point;
  String status;
  String desc;

  PopUpDetail({
    required this.namaS,
    required this.kelas, 
    required this.kategori, 
    required this.jenis, 
    required this.point, 
    required this.status, 
    required this.desc,
    super.key
  });

  @override
  Widget build(BuildContext context) {

    Widget textSendiri(String nama, double ukuran)
    {
      return Text(
        nama,
        style: blackTextStyle.copyWith(
          fontSize: ukuran,
          fontWeight: semibold
        ),
      );
    }

    Widget rowText(String nama1, String nama2, double ukuran)
    {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          textSendiri(nama1, ukuran),
          const SizedBox(width: 20,),
          textSendiri(nama2, ukuran),
        ],
      );
    }

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 180),
          decoration: BoxDecoration(
            // color: Colors.white.withOpacity(0.5),
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Center(child: textSendiri("Detail Laporan", 18)),
              const SizedBox(height: 20,),

              Expanded(
                child: ListView(
                  children: [
                    rowText("Nama : ", namaS, 15),
                    const SizedBox(height: 5,),
                    rowText("Kelas : ", kelas, 15),
                    const SizedBox(height: 5,),
                    rowText("Kategori : ", kategori, 15),
                    const SizedBox(height: 15,),
                    rowText("Jenis : ", "", 15),
                    textSendiri(jenis, 15),
                    const SizedBox(height: 15,),
                    rowText("Point : ", point, 15),
                    const SizedBox(height: 5,),
                    rowText("Status : ", int.parse(status) == 1 ? "Acc" : "Review", 15),
                    const SizedBox(height: 15,),
                    rowText("Deskripsi : ", "", 15),
                    textSendiri(desc, 15),
                  ],
                ),
              ),


              const SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  // ignore: avoid_unnecessary_containers
                  Container(
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: ElevatedButton(
                          onPressed: () {
                            print("Acc");
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green, // Ubah menjadi warna hijau yang diinginkan
                          ),
                          child: const Text('ACC'),
                        
                      ),
                    ),
                  ),

                  // ignore: avoid_unnecessary_containers
                  Container(
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: ElevatedButton(
                          onPressed: () {
                            print("Batalkan");
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.yellow.shade800, // Ubah menjadi warna hijau yang diinginkan
                          ),
                          child: const Text('Batalkan'),
                      ),
                    ),
                  ),

                  // ignore: avoid_unnecessary_containers
                  Container(
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        child: const Text('Tutup'),
                      ),
                    ),
                  ),

                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}