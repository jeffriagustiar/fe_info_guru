import 'dart:async';

import 'package:fe_info_guru/share/theme.dart';
import 'package:flutter/material.dart';

class PopUpSuccess extends StatefulWidget {
  const PopUpSuccess({super.key});

  @override
  State<PopUpSuccess> createState() => _PopUpSuccessState();
}

class _PopUpSuccessState extends State<PopUpSuccess> {

  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _cancelTimer();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.of(context).pop();
      }
    });
  }

  void _cancelTimer() {
    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            // color: Colors.white.withOpacity(0.5),
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset('assets/ic_success.gif'),
              // Center(
              //   child: Text(
              //     "Success",
              //     style: blackTextStyle.copyWith(
              //       fontSize: 25,
              //       fontWeight: bold
              //     ),
              //   )
              // )
            ],
          ),
        ),
      ),
    );
  }
}