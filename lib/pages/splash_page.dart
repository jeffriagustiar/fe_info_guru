// ignore_for_file: must_call_super

import 'dart:async';

import 'package:fe_info_guru/pages/home/home_page.dart';
import 'package:fe_info_guru/pages/sign_in.dart';
import 'package:fe_info_guru/share/theme.dart';
import 'package:flutter/material.dart';
import 'package:sp_util/sp_util.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override

  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushAndRemoveUntil(
        context, 
        MaterialPageRoute(
          builder: (context) => (SpUtil.getInt('a') == 1 ? const HomePage() : Sign_In()),
        ), 
        (SpUtil.getInt('a') == 1 ? ModalRoute.withName('/home') :ModalRoute.withName('/sign-in'))
      );
    });
    getInit();
    super.initState();
  }

  getInit() async{
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
          child: Container(
        width: 130,
        height: 150,
        decoration: const BoxDecoration(
            image: DecorationImage(
            image: AssetImage('assets/logo.png'),
        )),
      )),
    );
  }
}