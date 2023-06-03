import 'package:fe_info_guru/providers/siswa_provider.dart';
import 'package:fe_info_guru/share/theme.dart';
import 'package:fe_info_guru/widgets/appBar_buttom.dart';
import 'package:fe_info_guru/widgets/loading.dart';
import 'package:fe_info_guru/widgets/no_result_info_gif.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListKategoriPage extends StatefulWidget {
  const ListKategoriPage({super.key});

  @override
  State<ListKategoriPage> createState() => _ListKategoriPageState();
}

class _ListKategoriPageState extends State<ListKategoriPage> {

  bool _isRefreshing = false;

  
  data(String kategori) async{
    await Provider.of<SiswaProvider>(context, listen: false).getListKategori(kategori);
  }
  

  @override
  Widget build(BuildContext context) {

    SiswaProvider kategori = Provider.of<SiswaProvider>(context);

    final arg = ModalRoute.of(context)!.settings.arguments as Map;

    String nama = arg['nama'];
    String jenis = arg['jenis'];

    Future<void> getInit() async{
      setState(() {
        _isRefreshing = true;
      });
      setState(() {
        _isRefreshing = false;
      });
    }

    Widget list(String nama, String ket)
    {
      return Container(
        margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(18)
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    nama,
                    style: blackTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: medium
                    ),
                  ),
                  const SizedBox(height: 5,),
                  Text(
                    ket,
                    style: greyTextStyle.copyWith(
                      fontWeight: light
                    ),
                  ),
                              
                ],
              ),
            ),

            DropdownButton<String>(
              icon: const Icon(Icons.more_vert),
              underline: Container(),
              onChanged: (String? value) {
                if (value == "edit") {
                  print("edit");
                } 
                // else if (value == "hapus") {
                //   print("hapus");
                // }
              },
              items: <String>[
                "edit",
                // "hapus",
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value,style: blackTextStyle.copyWith(fontWeight: semibold),),
                );
              }).toList(),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: background4Color,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(
            context, 
            'add-kategori',
            arguments: {
              'nama' : nama,
              'jenis' : jenis,
            }
          );
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: getInit,
          child: Column(
            children: [
              AppBarButtom(nama: "List Kategori $nama"),
        
              Expanded(
                child: FutureBuilder(
                  future: data(jenis),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Loading();
                    } else if(kategori.listKategori.isEmpty){
                      return NoResultInfoGif(lebar: double.infinity);
                    } else {
                      return ListView(
                      children: kategori.listKategori.map((kate) => 
                        list(
                          kate.namaKategori.toString(),
                          kate.ket.toString()
                        )
                      ).toList(),
                    );
                    }
                    
                  }
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}