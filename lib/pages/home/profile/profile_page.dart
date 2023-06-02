import 'package:fe_info_guru/models/profile/profile_model.dart';
import 'package:fe_info_guru/providers/profile_provider.dart';
import 'package:fe_info_guru/share/theme.dart';
import 'package:fe_info_guru/widgets/appBar_buttom.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {

    ProfileProvider profileProvider = Provider.of<ProfileProvider>(context);
    ProfileModel profile = profileProvider.profile;
    String gendre;
    
    if (profile.kelamin.toString() == 'l') {
      gendre = 'Laki-laki';
    } else if(profile.kelamin.toString() == 'p'){
      gendre = 'Perempuan';
    } else{
      gendre = 'other';
    }

    Widget header(){
      return AppBar(
        backgroundColor: backgroundColor,
        automaticallyImplyLeading: false,
        elevation: 0,
        flexibleSpace: SafeArea(
          child: Container(
            padding: EdgeInsets.only(left: defaultMargin, right: defaultMargin, bottom: 20),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        profile.nama.toString(),
                        style: blackTextStyle.copyWith(
                          fontSize: 20,
                          fontWeight: semibold
                        ),
                      ),
                      Text(
                        'NIP : ${profile.nip}',
                        style: subTextStyle.copyWith(
                          fontSize: 16
                        ),
                      ),
                    ],
                  )
                ),
                const SizedBox(width: 16,),
                ClipOval(
                  child: profile.kelamin == 'p' ? Image.asset('assets/ic_profile_cewek.gif',width: 64,) : Image.asset('assets/ic_profile_cowok.gif',width: 64,),
                ),
              ],
            ),
          )
        ),
      );
    }

    Widget menuItem(String text,String text2){
      return Container(
        margin: const EdgeInsets.only(top: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(text, style: secondTextStyle.copyWith(fontSize: 13),),
            Text(text2, style: secondTextStyle.copyWith(fontSize: 13),textAlign: TextAlign.justify,),
          ],
        ),
      );
    }

    Widget personalBio(){
      return Container(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          margin: const EdgeInsets.all(10),
          width: double.infinity,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(15)
          ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20,),
              Text(
                'Biodata Pribadi',
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: semibold
                ),
              ),
              menuItem('Nama Lengkap', profile.nama.toString()),
              menuItem('Panggilan', profile.panggilan.toString()),
              menuItem('Jenis Kelamin', gendre),
              menuItem('Tempat Lahir', profile.tmplahir.toString()),
              menuItem('Tanggal Lahir', profile.tgllahir.toString()),
              menuItem('Agama', profile.agama.toString()),
              menuItem('Bahasa', 'INDONESIA'),
              const SizedBox(height: 20,)
            ],
          ),

        );
    }

    Widget contactInfo(){
      return Container(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          margin: const EdgeInsets.all(10),
          width: double.infinity,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(15)
          ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20,),
              Text(
                'Informasi Kontak',
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: semibold
                ),
              ),
              menuItem('Alamat :', ''),
              Text(
                profile.alamat.toString() ?? '-',
                style: secondTextStyle.copyWith(
                  fontSize: 13
                ),
                textAlign: TextAlign.justify,
              ),
              menuItem('Handphone', profile.handphone.toString()),
              menuItem('E-mail', profile.email.toString()),
              const SizedBox(height: 20,)
            ],
          ),

        );
    }

    Widget gelar(){
      return Container(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          margin: const EdgeInsets.all(10),
          width: double.infinity,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(15)
          ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20,),
              Text(
                'Informasi Gelar',
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: semibold
                ),
              ),
              menuItem('Gelar Depan', profile.gelarawal??'-'),
              menuItem('Gelar Belakang', profile.gelarakhir.toString()),
              menuItem('Gelar', profile.gelar??'-'),
              const SizedBox(height: 20,)
            ],
          ),

        );
    }

    return Scaffold(
      backgroundColor: background4Color,
      body: SafeArea(
        child: Column(
          children: [
            AppBarButtom(nama: 'Profile'),
            header(),
            Expanded(
              child: ListView(
                children: [
                  personalBio(),
                  gelar(),
                  contactInfo(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}