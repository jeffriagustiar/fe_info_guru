import 'package:fe_info_guru/providers/siswa_provider.dart';
import 'package:fe_info_guru/services/siswa_service.dart';
import 'package:fe_info_guru/share/theme.dart';
import 'package:fe_info_guru/widgets/appBar_buttom.dart';
import 'package:fe_info_guru/widgets/loading.dart';
import 'package:fe_info_guru/widgets/no_result_info_gif.dart';
import 'package:fe_info_guru/widgets/popUp_detail.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sp_util/sp_util.dart';

class ListLaporanPage extends StatefulWidget {
  const ListLaporanPage({super.key});

  @override
  State<ListLaporanPage> createState() => _ListLaporanPageState();
}

class _ListLaporanPageState extends State<ListLaporanPage> {

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
    await Provider.of<SiswaProvider>(context, listen: false).getListLaporan();
  }


  @override
  Widget build(BuildContext context) {

    SiswaProvider laporan = Provider.of<SiswaProvider>(context);

    acc(String rid) async {
      if (await laporan.validasiLaporan(rid, '1')) {
        getInit();
      } else {
        getInit();
        // showDialog(
        //   context: context,
        //   builder: (BuildContext context) {
        //     return Text("Gagal Validasi");
        //   },
        // ); 
      }
    }
    
    String? kelola = SpUtil.getString('kelola');
    
    Widget list(
      String nama, 
      String kelas, 
      String kategori, 
      String jenis, 
      String point, 
      String status, 
      String desc,
      String id
    )
    {
      return Column(
        children: [
          TextButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context){
                  return PopUpDetail(
                    namaS: nama, 
                    kelas: kelas,
                    kategori: kategori,
                    jenis: jenis, 
                    point: point,
                    status: status,
                    desc : desc,
                    rid: id,
                  );
                }
              );
            },
            child: Container(
              padding: const EdgeInsets.all(10),
              width: double.infinity,
              height: 90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                  color: int.parse(point) < 0 ? Colors.red.shade100 : Colors.green.shade100
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                  
                      // ignore: sized_box_for_whitespace
                      Container(
                        width: 150,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                nama,
                                style: blackTextStyle.copyWith(
                                  fontSize: 15,
                                  fontWeight: semibold
                                )
                              ),
                              Text(
                                jenis,
                                style: blackTextStyle.copyWith(
                                  fontSize: 14,
                                  fontWeight: regular
                                ),
                                overflow: TextOverflow.ellipsis,
                                softWrap: false,
                              ),
                            ],
                          ),
                      ),

                  
                        Text(
                          point,
                          style: blackTextStyle.copyWith(
                            fontSize: 20,
                            fontWeight: semibold
                          ),
                        ),
                      const SizedBox(width: 5,),
                  
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Status",
                              style: blackTextStyle.copyWith(
                                fontSize: 15,
                                fontWeight: semibold
                              ),
                            ),
                            const SizedBox(height: 5,),
                            Text(
                              int.parse(status) == 1 ? "Acc" : "Review",
                              style: blackTextStyle.copyWith(
                                fontSize: 15,
                                fontWeight: semibold,
                                color: Colors.black
                              ),
                            )
                          ],
                        ),
                  
                        kelola == 'BK' ?
                          TextButton(
                            onLongPress: () {},
                            onPressed: (){
                              acc(id);
                            }, 
                            child: const Icon(Icons.check,size: 30,color: Colors.black,)
                          )
                        : 
                          const SizedBox(width: 0,)
                  
                  ],
                ),
            ),
          )
        ],
      );
    }

    return Scaffold(
      backgroundColor: background4Color,
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: getInit,
          child: Column(
            children: [
              AppBarButtom(nama: "List Laporan"),
        
              Expanded(
                child: FutureBuilder(
                  future: data(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Loading();
                    } else if(laporan.listLaporan.isEmpty){
                      return NoResultInfoGif(lebar: double.infinity);
                    } else {
                      return ListView(
                        children: laporan.listLaporan.map((lapor) => 
                          list(
                            lapor.nama.toString(),
                            lapor.kelas.toString(), 
                            lapor.kategori.toString(), 
                            lapor.jenis.toString(), 
                            lapor.point.toString(), 
                            lapor.acc.toString(), 
                            lapor.ket.toString(),
                            lapor.replid.toString()
                          )
                        ).toList(),
                      );
                    }
                  }
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}