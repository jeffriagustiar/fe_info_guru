import 'package:fe_info_guru/share/theme.dart';
import 'package:flutter/material.dart';

class NoResultInfoGif extends StatelessWidget {
  final double lebar;
  // ignore: prefer_const_constructors_in_immutables, use_key_in_widget_constructors
  NoResultInfoGif({required this.lebar});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset('assets/ic_no_result.gif',width: lebar,),
        const SizedBox(height: 5,),
        Text("No Result",style: blackTextStyle.copyWith(fontWeight: bold, fontSize: 16),)
      ]
    );
  }
}