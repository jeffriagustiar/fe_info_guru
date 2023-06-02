import 'package:fe_info_guru/share/theme.dart';
import 'package:fe_info_guru/widgets/appBar_buttom.dart';
import 'package:fe_info_guru/widgets/fitur_buttom.dart';
import 'package:flutter/material.dart';

class MenuLaporanPage extends StatelessWidget {
  const MenuLaporanPage({super.key});

  @override
  Widget build(BuildContext context) {

    Widget backGround(){
      return Container(
        width: double.infinity,
        height: 250,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30)),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/bg_lapor.png'),
          )
        ),
      );
    }

    Widget contentLapor(){
      return Container(
        padding: const EdgeInsets.only(top: 310,left: 20,right: 20),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.only(top: 20),
              // height: 400,
              width: double.infinity,
              decoration: BoxDecoration(
                color: background4Color,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 10,
                    offset: const Offset(0, 1),
                  ),
                ]
              ),
              child: Column(
                children: [
                  const SizedBox(height: 10,),
                  Text(
                    "Lapor",
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: bold
                    ),
                  ),
                  const SizedBox(height: 10,),

                  GridView(
                    padding: const EdgeInsets.only(top: 10,bottom: 10 ),
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      childAspectRatio: 0.6,
                    ),
                    shrinkWrap: true,
                      children: [
                        FiturButtom(
                          nama: 'Laporkan', 
                          onPressed: () {
                            Navigator.pushNamed(
                              context, 
                              'laporkan',
                            );
                          },
                          img: 'assets/ic_add_report.png',
                        ),
                        FiturButtom(
                          nama: 'List Laporan', 
                          onPressed: () {
                            Navigator.pushNamed(
                              context, 
                              'list-laporan'
                            );
                          },
                          img: 'assets/ic_list_lapor.png',
                        ),
                      ],
                      
                    ),


                ],
              ),
            )
          ],
        ),
      );
    }

    Widget info(){
      return Container(
        width: double.infinity,
        margin: const EdgeInsets.only(top: 120,left: 20,right: 20),
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 30),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 10,
              offset: const Offset(0, 1),
            ),
          ]
        ),
              
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 6,),
            Text(
              "Laporan terhadap siswa yang bapak/ibuk buat tidak bisa langsung dihitung sebagai point, karena akan divalidasi oleh guru BK terlebih dahulu",
              style: blackTextStyle.copyWith(
                height: 2,
                fontSize: 14,
                fontWeight: regular
              ),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 6,),
          ],
        ),
      );
    }
    
    return Scaffold(
      backgroundColor: background4Color,
      body: SafeArea(
        child: Column(
          children: [
            AppBarButtom(nama: 'Lapor Siswa'),
            Expanded(
              child: ListView(
                children: [
                  Stack(
                    children: [
                      backGround(),
                      info(),
                      contentLapor(),
                    ],
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