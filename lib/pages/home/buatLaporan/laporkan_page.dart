import 'package:fe_info_guru/services/siswa_service.dart';
import 'package:fe_info_guru/share/theme.dart';
import 'package:fe_info_guru/widgets/appBar_buttom.dart';
import 'package:fe_info_guru/widgets/text_fild.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';

class LaporkanPage extends StatefulWidget {
  const LaporkanPage({super.key});

  @override
  State<LaporkanPage> createState() => _LaporkanPageState();
}

class _LaporkanPageState extends State<LaporkanPage> {

  List _get = [];
  String nama = '-';
  String nis = '-';
  String kelas = '-';

  @override
  Widget build(BuildContext context) {

    Widget textForm(String nama)
    {
      return Text(
        nama,
        style: blackTextStyle.copyWith(
          fontSize: 15,
          fontWeight: semibold
        ),
        textAlign: TextAlign.center,
      );
    }

    Widget pilihSiswa()
    {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  width: double.infinity,
                  height: 80,
                  decoration: BoxDecoration(
                    color: backgroundColor,
                    borderRadius: BorderRadius.circular(12)
                  ),
                  child: Center(
                  child: Row(
                    children: [
                      const Icon(
                        Icons.person,
                        color: Colors.blue,
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: DropdownSearch<dynamic>(
                          dropdownSearchDecoration: const InputDecoration(
                            labelText: "Siswa",
                            hintText: "Pilih Siswa",
                          ),
                                              
                          mode: Mode.BOTTOM_SHEET,
                          showSearchBox: true,
                                              
                          onFind: (text) async {
                            List<dynamic> result = await SiswaService().getAllSiswa2();
                            setState(() {
                              _get = 
                              result;
                            });
                            // ignore: unnecessary_cast
                            return _get as List<dynamic>;
                          },
                                              
                          onChanged: (value) {
                            setState(() {                      
                              nama = value['nama'];
                              nis = value['nis'];
                              kelas = value['kelas'];
                            });
                          },
                                              
                          itemAsString: (item) => item['nama'] + ' - ' + item['nis'],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
                            
      ]
    );
  }

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
      
            AppBarButtom(nama: 'Buat Laporan'),

            textForm("Form Untuk Melaporkan Pelanggaran Siswa"),
      
            Expanded(
              child: ListView(
                children: [
                  Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: background4Color
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        pilihSiswa(),

                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: backgroundColor
                            ),
                            child: Column(
                              children: [
                                textForm(nama),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 40),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      textForm(nis),
                                      textForm(kelas)
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        
                        TextFildSendiri(hint: "Kategori"),
                        TextFildSendiri(hint: "Jenis"),
                        TextFildSendiri(hint: "Pelanggaran"),

                        const SizedBox(height: 10,),
                        textForm("Point : 10"),
                        const SizedBox(height: 10,),

                        TextFildSendiri(hint: "Keterangan"),

                      ],
                    )
                  )
                ],
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}