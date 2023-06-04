import 'package:fe_info_guru/models/catatan/kategori_model2.dart';
import 'package:fe_info_guru/providers/siswa_provider.dart';
import 'package:fe_info_guru/share/theme.dart';
import 'package:fe_info_guru/widgets/appBar_buttom.dart';
import 'package:fe_info_guru/widgets/popup_success.dart';
import 'package:fe_info_guru/widgets/text_buttom_sendiri.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditKategoriPage extends StatefulWidget {
  final KategoriModel2 kategori;
  final String namaK;
  final String jenis;

  EditKategoriPage(this.kategori,{required this.namaK, required this.jenis});

  @override
  State<EditKategoriPage> createState() => _EditKategoriPageState();
}

class _EditKategoriPageState extends State<EditKategoriPage> {


  @override
  Widget build(BuildContext context) {

  TextEditingController namaController = TextEditingController(text: widget.kategori.namaKategori);
  TextEditingController descController = TextEditingController(text: widget.kategori.ket);

    SiswaProvider kategoriEdit = Provider.of<SiswaProvider>(context);

    simpan() async{

      if (namaController.text.isEmpty) {
        // showDialog(
        //   context: context, 
        //   builder: (BuildContext context) {
        //     return Text("Nama Kategori Tidak Boleh Kosong",style: blackTextStyle.copyWith(fontWeight: semibold,fontSize: 18),);
        //   }
        // );
      } else {
        if (await kategoriEdit.editKategori(widget.kategori.replid.toString(), namaController.text, descController.text)) {
          
        // ignore: use_build_context_synchronously
        showDialog(
          context: context, 
          builder: (BuildContext context) {
            return const PopUpSuccess();
          }
        );

        } else {
          
        }
      }


    }

    return Scaffold(
      backgroundColor: background4Color,
      body: SafeArea(
        child: Column(
          children: [
            AppBarButtom(nama: 'Edit Kategori '+widget.namaK),

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
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 16),
                                  width: double.infinity,
                                  height: 50,
                                  decoration: BoxDecoration(
                                      color: backgroundColor,
                                      borderRadius: BorderRadius.circular(12)),
                                  child: Center(
                                    child: Row(
                                      children: [
                                        const Icon(
                                          Icons.text_fields,
                                          color: Colors.blue,
                                        ),
                                        const SizedBox(
                                          width: 15,
                                        ),
                                        Expanded(
                                          child: TextFormField(
                                            style: blackTextStyle,
                                            controller: namaController,
                                            decoration: InputDecoration.collapsed(
                                              hintText: "Nama Kategori",
                                              hintStyle: secondTextStyle,
                                            ),
                                          )
                                        )
                                      ],
                                    ),
                                  )
                                ),

                                const SizedBox(height: 20,),

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

                                const SizedBox(height: 20,),

                                TextButtomSendiri(
                                  nama: "Simpan", 
                                  lebar: double.infinity, 
                                  onPressed: simpan
                                )
                                

                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  
                ],
              )
            )
          ],
        )
      ),
    );
  }
}