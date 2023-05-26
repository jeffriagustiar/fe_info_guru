import 'package:fe_info_guru/models/catatan/kategori_model.dart';
import 'package:fe_info_guru/providers/catatan_provider.dart';
import 'package:fe_info_guru/share/theme.dart';
import 'package:fe_info_guru/widgets/appBar_buttom.dart';
import 'package:fe_info_guru/widgets/loading.dart';
import 'package:fe_info_guru/widgets/text_buttom_sendiri.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InfoPointPage extends StatefulWidget {
  const InfoPointPage({super.key});

  @override
  State<InfoPointPage> createState() => _InfoPointPageState();
}

class _InfoPointPageState extends State<InfoPointPage> {
  String kate='pelanggaran';
  String getTitleByIndex(int index) {
    switch (index) {
      case 0:
        return "prestasi";
      case 1:
        return "hukuman";
      case 2:
        return "pelanggaran";
      default:
        return "";
    }
  }

  // ignore: unused_field
  bool _isRefreshing = false;

  Future<void> getInit() async{
    setState(() {
      _isRefreshing = true;
    });
    data();
    setState(() {
      _isRefreshing = false;
    });
  }

  data() async{
    await Provider.of<CatatanProvider>(context, listen: false).getInfoCatatan(kate);
  }

  @override
  Widget build(BuildContext context) {

    CatatanProvider infoCatatanSiswa = Provider.of<CatatanProvider>(context);

    Widget infoPoint(String nmCtt, String poin2)
    {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            nmCtt,
            style: blackTextStyle.copyWith(
              fontSize: 15,
              fontWeight: regular
            ),
          ),
          Text(
            poin2.toString(),
            style: blackTextStyle.copyWith(
              fontSize: 15,
              fontWeight: regular,
              color:  int.parse(poin2) < 0 ? Colors.red : Colors.green
            ),
          )
        ],
      );
    }

    Widget catatan(String nama, String desc, KategoriModel km)
    {
      return Column(
        crossAxisAlignment:CrossAxisAlignment.start,
        children: [
          Text(
            nama,
            style: blackTextStyle.copyWith(
              fontSize: 18,
              fontWeight: bold
            ),
          ),
          Text(
            "Keterangan : $desc",
            style: blackTextStyle.copyWith(
              fontSize: 14,
              fontWeight: light
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            width: double.infinity,
            height: 1,
            color: blackColor,
          ),
          const SizedBox(height: 5,),
          Column(
            children: km.detail!.map((kmCtt) => 
              infoPoint(
                kmCtt.namaCtt.toString(),
                kmCtt.point.toString() 
              )).toList(),
          ),
          const SizedBox(height: 20,),
        ],
      );
    }

    return Scaffold(
      backgroundColor: background4Color,
      body: SafeArea(
        child: Column(
          children: [
            AppBarButtom(nama: 'Informasi Point'),

            Container(
              height: 80,
              child: Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 3, // Jumlah item dalam List View
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextButtomSendiri(
                          nama: getTitleByIndex(index), // Mengganti "Prestasi", "Hukuman", dan "Pelanggaran" dengan judul sesuai dengan indeks
                          lebar: 150, // Lebar setiap item
                          onPressed: () {
                            setState(() {
                              kate=getTitleByIndex(index);
                            });
                          },
                        ),
                      );
                    },
                  ),
                ),
            ),

            Expanded(
              child: ListView(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: backgroundColor
                    ),
                    child: FutureBuilder(
                      future: data(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return const Loading();
                        } else {
                          return Column(
                            children: infoCatatanSiswa.infoCatatan.map((info) => catatan(
                              info.namaKategori.toString(),
                              info.ket.toString(),
                              info
                            )).toList()
                          );
                        }
                      }
                    )
                  )
                ],
              )
            )
            
          ],
        )
      ),
    );
  }
}