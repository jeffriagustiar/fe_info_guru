import 'package:fe_info_guru/pages/home/profile/profile_page.dart';
import 'package:fe_info_guru/pages/splash_page.dart';
import 'package:fe_info_guru/providers/auth_provider.dart';
import 'package:fe_info_guru/providers/profile_provider.dart';
import 'package:fe_info_guru/share/theme.dart';
import 'package:fe_info_guru/widgets/fitur_buttom.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sp_util/sp_util.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String? token = SpUtil.getString('token');
  int? angka = SpUtil.getInt('a');
  String? nip = SpUtil.getString('nip');
  String? kelamin = SpUtil.getString('kelamin');
  String? kelola = SpUtil.getString('kelola');

  // ignore: unused_field
  bool _isRefreshing = false;
  

  @override
  void initState() {
    super.initState();
    data();
    print("bisa");
  }

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
    await Provider.of<ProfileProvider>(context, listen: false).getProfile();
  }
  
  @override
  Widget build(BuildContext context) {

    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    handleLogOut() async {
      await authProvider.logout(
        nip: nip.toString(),
        token: token!,
      );
      SpUtil.putInt('a', 0);
      SpUtil.putString('token', 'Bearer ');
      // ignore: use_build_context_synchronously
      Navigator.pushAndRemoveUntil(
        context, 
        MaterialPageRoute(
          builder: (context) => const SplashPage(),
        ), 
        ModalRoute.withName('/'));
    }


    Widget header(){
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
          left: defaultMargin,
          right: defaultMargin,
        ),

        child: Row(
          children: [

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    SpUtil.getString('nama')!,
                    style: blackTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: semibold
                    ),
                  ),
                  Text(
                    "Welcome",style: greyTextStyle.copyWith(
                      fontSize: 12,
                      fontWeight: regular
                    ),
                  ),
                ],
              ),
            ),

            ClipOval(
              child: GestureDetector(
                onTap: (){
                  Navigator.push(
                    context, 
                    MaterialPageRoute(
                      builder: (context) => const ProfilePage(),
                    )
                  );
                },
                child: SizedBox(
                  height: 50,
                  width: 50,
                  child: kelamin == 'p' ? Image.asset('assets/ic_profile_cewek.gif',width: 64,) : Image.asset('assets/ic_profile_cowok.gif',width: 64,)
                )
              ),
            )

          ],
        ),

      );
    }

    Widget fiturGeneral(){
      return Container(
        padding: const EdgeInsets.only(top: 15,bottom: 15),
        margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: background4Color,
          borderRadius: BorderRadius.circular(15)
        ),
        child: Column(
          children: [

            Text(
              "General",
              style: blackTextStyle.copyWith(
                fontSize: 15,
                fontWeight: semibold
              ),
            ),

            GridView(
              padding: const EdgeInsets.only(top: 10,bottom: 10 ),
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                childAspectRatio: 0.7,
              ),
              shrinkWrap: true,
              children: [
                FiturButtom(
                  nama: 'Profile', 
                  onPressed: () {
                    Navigator.pushNamed(context, '/profile');
                  },
                  img: kelamin == 'p' ? 'assets/ic_profile_cewek.gif' : 'assets/ic_profile_cowok.gif',
                ),
                FiturButtom(
                  nama: "Info Point", 
                  onPressed: (){
                    Navigator.pushNamed(context, 'info-point');
                  }, 
                  img: 'assets/ic_info2.png'
                ),
                FiturButtom(
                  nama: "Lapor Siswa", 
                  onPressed: (){
                    Navigator.pushNamed(context, 'menu-laporan');
                  }, 
                  img: 'assets/ic_report_siswa.png'
                ),
                FiturButtom(
                  nama: 'Logout', 
                  onPressed: handleLogOut, 
                  img: 'assets/ic_logout.png',
                ),
              ],
            )

          ],
        ),
      );
    }  

    Widget fiturBk(){
      return Container(
        padding: const EdgeInsets.only(top: 15,bottom: 15),
        margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: background4Color,
          borderRadius: BorderRadius.circular(15)
        ),
        child: Column(
          children: [

            Text(
              "Bimbingan Konseling",
              style: blackTextStyle.copyWith(
                fontSize: 15,
                fontWeight: semibold
              ),
            ),

            GridView(
              padding: const EdgeInsets.only(top: 10,bottom: 10 ),
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                childAspectRatio: 0.7,
              ),
              shrinkWrap: true,
              children: [
                FiturButtom(
                  nama: 'Kategori', 
                  onPressed: () {
                    Navigator.pushNamed(context, 'menu-kategori');
                  },
                  img: 'assets/ic_list.png',
                ),
                FiturButtom(
                  nama: 'Jenis', 
                  onPressed: () {
                    Navigator.pushNamed(context, 'laporkan');
                  },
                  img: 'assets/ic_list.png',
                ),
                FiturButtom(
                  nama: 'Laporkan', 
                  onPressed: () {
                    Navigator.pushNamed(context, 'laporkan');
                  },
                  img: 'assets/ic_add_report.png',
                ),
                FiturButtom(
                  nama: 'List Laporan', 
                  onPressed: () {
                    Navigator.pushNamed(context, 'list-laporan');
                  },
                  img: 'assets/ic_list_lapor.png',
                ),
              ],
            )

          ],
        ),
      );
    }  


    return Scaffold(
      backgroundColor: backgroundColor,
      body: RefreshIndicator(
        onRefresh: getInit,
        child: ListView(
          children: [
            header(),
            fiturGeneral(),
            kelola == 'BK' ? fiturBk() : const SizedBox(height: 0,)
          ],
        ),
      ),
    );
  }
}