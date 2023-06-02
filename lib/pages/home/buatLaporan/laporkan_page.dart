import 'package:fe_info_guru/providers/siswa_provider.dart';
import 'package:fe_info_guru/services/siswa_service.dart';
import 'package:fe_info_guru/share/theme.dart';
import 'package:fe_info_guru/widgets/appBar_buttom.dart';
import 'package:fe_info_guru/widgets/text_buttom_sendiri.dart';
import 'package:fe_info_guru/widgets/transpatant_popup.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:provider/provider.dart';
import 'package:sp_util/sp_util.dart';

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
  String idKategori = '-';
  String idJenis = '-';
  String point = '0';
  String kategori = 'pelanggaran';
  String? kelola = SpUtil.getString('kelola');
  bool isLoading = false;
  
  TextEditingController descController = TextEditingController(text: '');


  @override
  Widget build(BuildContext context) {

    SiswaProvider siswaProvider = Provider.of<SiswaProvider>(context);

    simpan() async {
      setState(() {
        isLoading = true;
      });

      if (nis == '-' || idJenis == '-' || descController.text.isEmpty) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return TransparentPopup(info: 1, nis: nis, jenis: idJenis,desc: descController.text.isEmpty,);
          },
        ); 
      } else {

        if (await siswaProvider.laporkanSiswa(nis, idJenis, descController.text, point)) {
          // ignore: use_build_context_synchronously
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return TransparentPopup(info: 2, nis: nis, jenis: idJenis,desc: descController.text.isEmpty,);
            },
          ); 

          //reset
          descController.clear();
          nama = '-';
          nis = '-';
          kelas = '-';
          point = '0';
        } else {
          // ignore: use_build_context_synchronously
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: alertColor,
              content: const Text(
                'Gagal Buat Laporan!',
                textAlign: TextAlign.center,
              )));
        }

      }

      setState(() {
        isLoading = false;
      });
    }

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
  
  Widget pilihKategori()
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
                        Icons.list_alt_rounded,
                        color: Colors.blue,
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: DropdownSearch<dynamic>(
                          dropdownSearchDecoration: const InputDecoration(
                            labelText: "Kategori",
                            hintText: "Pilih Kategori",
                          ),
                                                
                          mode: Mode.BOTTOM_SHEET,
                          showSearchBox: true,
                                                
                          onFind: (text) async {
                            List<dynamic> result = await SiswaService().getAllKategori(kategori);
                            setState(() {
                              _get = 
                              result;
                            });
                            // ignore: unnecessary_cast
                            return _get as List<dynamic>;
                          },
                                                
                          onChanged: (value) {
                            setState(() {                      
                              idKategori = value['replid'].toString();
                            });
                          },
                                                
                          itemAsString: (item) => item['nama_kategori'],
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

  Widget pilihJenis()
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
                height: 100,
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(12)
                ),
                child: Center(
                  child: Row(
                    children: [
                      const Icon(
                        Icons.list_alt_rounded,
                        color: Colors.blue,
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: DropdownSearch<dynamic>(
                          dropdownSearchDecoration: const InputDecoration(
                            labelText: "Jenis",
                            hintText: "Pilih Jenis",
                          ),
                                                
                          mode: Mode.BOTTOM_SHEET,
                          showSearchBox: true,
                                                
                          onFind: (text) async {
                            List<dynamic> result = await SiswaService().getAllJenis(idKategori);
                            setState(() {
                              _get = 
                              result;
                            });
                            // ignore: unnecessary_cast
                            return _get as List<dynamic>;
                          },
                                                
                          onChanged: (value) {
                            setState(() {                      
                              idJenis = value['replid'].toString();
                              point = value['point'].toString();
                            });
                          },
                                                
                          itemAsString: (item) => item['nama_ctt'],
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

  Widget pilihCatatan()
  {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: backgroundColor
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15)
              )
            ),
            onPressed: (){
              setState(() {
                kategori = 'pelanggaran';
              });
            }, 
            child: Text("Pelanggaran",style: blackTextStyle)
          ),
          TextButton(
            style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15)
              )
            ),
            onPressed: (){
              setState(() {
                kategori = 'hukuman';
              });
            }, 
            child: Text("Hukuman",style: blackTextStyle)
          ),
          TextButton(
            style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15)
              )
            ),
            onPressed: (){
              setState(() {
                kategori = 'prestasi';
              });
            }, 
            child: Text("Prestasi",style: blackTextStyle)
          ),
        ],
      )
    );
  }

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
      
            AppBarButtom(nama: 'Buat Laporan'),

            textForm("Form Untuk Melaporkan Pelanggaran Siswa"),

            const SizedBox(height: 10,),
      
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

                        kelola == 'BK' ? pilihCatatan() : const SizedBox(height: 0,),

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
                                      textForm(kelas),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        
                        pilihKategori(),
                        pilihJenis(),

                        const SizedBox(height: 10,),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: int.parse(point) < 0 ? Colors.red.shade100 : Colors.green.shade100
                            ),
                          child: textForm("Point : $point")
                        ),
                        const SizedBox(height: 10,),

                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: backgroundColor
                            ),
                          child: TextField(
                            maxLines: null,
                            controller: descController,
                            decoration: const InputDecoration(
                              hintText: 'Deskripsikan disini',
                              border: OutlineInputBorder(),
                            ),
                            
                          ),
                        ),

                        TextButtomSendiri(
                          nama: "Simpan", 
                          lebar: double.infinity, 
                          onPressed: simpan
                        )

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