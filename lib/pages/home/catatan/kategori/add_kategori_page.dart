import 'package:fe_info_guru/share/theme.dart';
import 'package:fe_info_guru/widgets/appBar_buttom.dart';
import 'package:fe_info_guru/widgets/text_buttom_sendiri.dart';
import 'package:flutter/material.dart';

class AddKategoriPage extends StatefulWidget {
  const AddKategoriPage({super.key});

  @override
  State<AddKategoriPage> createState() => _AddKategoriPageState();
}

class _AddKategoriPageState extends State<AddKategoriPage> {

  TextEditingController namaController = TextEditingController(text: '');
  TextEditingController descController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {

    final arg = ModalRoute.of(context)!.settings.arguments as Map;

    String nama = arg['nama'];
    String jenis = arg['jenis'];

    simpan(){
      namaController.clear();
      descController.clear();
    }

    return Scaffold(
      backgroundColor: background4Color,
      body: SafeArea(
        child: Column(
          children: [
            AppBarButtom(nama: 'Add Kategori $nama'),

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