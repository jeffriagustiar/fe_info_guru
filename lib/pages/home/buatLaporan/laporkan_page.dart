import 'package:fe_info_guru/share/theme.dart';
import 'package:fe_info_guru/widgets/appBar_buttom.dart';
import 'package:fe_info_guru/widgets/text_fild.dart';
import 'package:flutter/material.dart';

class LaporkanPage extends StatelessWidget {
  const LaporkanPage({super.key});

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
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
      
            AppBarButtom(nama: 'Buat Laporan'),

            textForm("Form Untuk Melaporkan Siswa"),
      
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
                        TextFildSendiri(hint: "NIS Siswa"),

                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Column(
                            children: [
                              textForm("Abc"),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 40),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    textForm("123"),
                                    textForm("X Abc")
                                  ],
                                ),
                              )
                            ],
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