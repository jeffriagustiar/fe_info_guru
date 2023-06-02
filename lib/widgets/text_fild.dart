import 'package:fe_info_guru/share/theme.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextFildSendiri extends StatelessWidget {
  // String nama;
  String hint;
  // Function controller;
  
  TextFildSendiri({
    // required this.nama, 
    required this.hint, 
    // required this.controller,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text(
            //   nama,
            //   style:
            //       blackTextStyle.copyWith(fontWeight: medium, fontSize: 16),
            // ),
            // const SizedBox(
            //   height: 10,
            // ),
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                    color: backgroundColor,
                    borderRadius: BorderRadius.circular(12)),
                child: Center(
                  child: Row(
                    children: [
                      const Icon(
                        Icons.person,
                        color: Colors.blue,
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: TextFormField(
                          style: blackTextStyle,
                          // controller: controller(),
                          decoration: InputDecoration.collapsed(
                            hintText: hint,
                            hintStyle: secondTextStyle,
                          ),
                        )
                      )
                    ],
                  ),
                )
              )
          ],
        ),
      );
  }
}