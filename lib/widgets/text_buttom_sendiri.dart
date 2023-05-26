import 'package:fe_info_guru/share/theme.dart';
import 'package:flutter/material.dart';

class TextButtomSendiri extends StatelessWidget {
  final String nama;
  final double lebar;
  final Function() onPressed;
  // ignore: prefer_const_constructors_in_immutables
  TextButtomSendiri({super.key, required this.nama, required this.lebar, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        width: lebar,
        margin: const EdgeInsets.only(top: 10),
        child: TextButton(
            style: TextButton.styleFrom(
                backgroundColor: Colors.blue.shade200,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12))),
            onPressed: onPressed,
            child: Text(
              nama,
              style:
                  blackTextStyle.copyWith(fontWeight: semibold, fontSize: 20),
            )),
      );
  }
}