// ignore_for_file: file_names

import 'package:fe_info_guru/share/theme.dart';
import 'package:flutter/material.dart';

class AppBarButtom extends StatelessWidget {
  final String nama;

  // ignore: prefer_const_constructors_in_immutables, use_key_in_widget_constructors
  AppBarButtom({required this.nama});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: double.infinity,
      // margin: EdgeInsets.symmetric(horizontal: 15),
      padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
      // color: backgroundColor,
      decoration: BoxDecoration(
        color: transparantColor,
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.grey.withOpacity(0.5),
        //     spreadRadius: 2,
        //     blurRadius: 10,
        //     offset: const Offset(0, 1),
        //   ),
        // ]
      ),
      child: Material(
        color: transparantColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              }, 
              icon: const Icon(
                Icons.chevron_left
              ),
              splashRadius: 30,
              splashColor: Colors.blue,
            ),
            Expanded(
              child: Text(
                nama,
                style: blackTextStyle.copyWith(
                  fontWeight: bold,
                  fontSize: 17
                ),
                textAlign: TextAlign.center,
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/home');
              }, 
              icon: const Icon(Icons.home),
              splashRadius: 30,
              splashColor: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}