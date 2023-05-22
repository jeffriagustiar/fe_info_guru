import 'package:fe_info_guru/pages/splash_page.dart';
import 'package:fe_info_guru/providers/auth_provider.dart';
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
  String? kelamin = SpUtil.getString('nip');

  // ignore: unused_field
  bool _isRefreshing = false;
  

  @override
  void initState() {
    super.initState();
    print("bisa");
  }

  Future<void> getInit() async{
    setState(() {
      _isRefreshing = true;
    });
    // data();
    setState(() {
      _isRefreshing = false;
    });
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
                    SpUtil.getString('nip')!,
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
                  // Navigator.push(
                  //   context, 
                  //   MaterialPageRoute(
                  //     builder: (context) => const ProfilePage(),
                  //   )
                  // );
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

    Widget fitur(){
      return Container(
        margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: background4Color,
          borderRadius: BorderRadius.circular(15)
        ),
        child: Column(
          children: [

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

    Widget tailHadir(
      String nama, 
      String kelas, 
      String jam, 
      String kelamin
    )
    {
      return Container(
        margin: const EdgeInsets.only(left: 5),
        decoration: BoxDecoration(
          color: background4Color,
          borderRadius: BorderRadius.circular(15)
        ),
        child: Column(
          children: [
      
            Container(
              width: 110,
              height: 100,
              margin: const EdgeInsets.only(top: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    kelamin == 'p' ? 'assets/ic_profile_cewek.gif' : 'assets/ic_profile_cowok.gif'
                  )
                )
              ),
            ),
      
            Container(
              margin: const EdgeInsets.only(left: 5, top: 10),
              width: 110,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(nama, style: blackTextStyle.copyWith(fontWeight: medium),),
                  Text("Kelas : $kelas", style: blackTextStyle.copyWith(fontWeight: medium),),
                  Text("Jam : $jam", style: blackTextStyle.copyWith(fontWeight: medium),),
                ],
              )
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
            fitur(),
          ],
        ),
      ),
    );
  }
}