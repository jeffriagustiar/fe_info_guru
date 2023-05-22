import 'package:fe_info_guru/share/theme.dart';
import 'package:flutter/material.dart';

class FiturButtom extends StatelessWidget {
  final String nama;
  final Function() onPressed;
  final String img;
  
  // ignore: prefer_const_constructors_in_immutables, use_key_in_widget_constructors
  FiturButtom({required this.nama, required this.onPressed, required this.img});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      // ignore: avoid_unnecessary_containers
      child: Container(
        child: Column(
          children: [
            Container(
              height: 50,
              width: 50,
              margin: const EdgeInsets.only(bottom: 12,),
              decoration: BoxDecoration(
                color: background3Color,
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(image: AssetImage(img))
              ),
            ),
            Text(
              nama,
              style: blackTextStyle.copyWith(
                fontSize: 12,
                fontWeight: regular
              ),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}