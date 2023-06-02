import 'package:fe_info_guru/share/theme.dart';
import 'package:fe_info_guru/widgets/appBar_buttom.dart';
import 'package:fe_info_guru/widgets/popUp_detail.dart';
import 'package:flutter/material.dart';
import 'package:sp_util/sp_util.dart';

class ListLaporanPage extends StatelessWidget {
  const ListLaporanPage({super.key});

  @override
  Widget build(BuildContext context) {

    String? kelola = SpUtil.getString('kelola');
    
    Widget list(String nama, String kelas, String kategori, String jenis, String point, String status, String desc)
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
                  );
                }
              );
            },
            child: Container(
              padding: const EdgeInsets.all(10),
              width: double.infinity,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                  color: Colors.red.shade100
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
                                color: int.parse(status) == 1 ? Colors.green.shade400 : Colors.black
                              ),
                            )
                          ],
                        ),
                  
                        kelola == 'guru' ?
                          TextButton(
                            onLongPress: () {
                              // print("object");
                            },
                            onPressed: (){}, 
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
        child: Column(
          children: [
            AppBarButtom(nama: "List Laporan"),

            Expanded(
              child: ListView(
                children: [

                  list("jhon abc","X ABC","sedang","Cabut","-10",'1',"ejkehdjkfsd sdkfsdjhfjsdhfjsd"),
                  list("jhon cba","XI ABBC","berat","Merokok","-5",'0',"jksdhjsf jfdshfhghkeew weuyiuwef"),
                  list("jhon aaa","XII ABCC","sedang","Aplpa Aplpa Aplpa Aplpa Aplpa Aplpa Aplpa Aplpa","-8",'0',"dkjwfhjw weiuioweur ewiyriuwer"),
                  
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}