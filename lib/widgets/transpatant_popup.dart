import 'dart:async';
import 'package:fe_info_guru/share/theme.dart';
import 'package:flutter/material.dart';

class TransparentPopup extends StatefulWidget {
  String nis;
  String jenis;
  bool desc;

  TransparentPopup({required this.nis, required this.jenis, required this.desc, super.key});

  @override
  _TransparentPopupState createState() => _TransparentPopupState();
}

class _TransparentPopupState extends State<TransparentPopup> {
  Timer? _timer;
  String textTampil='';

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

    if (widget.nis == '-') {
      textTampil = 'Pilih Siswa Terlebih Dahulu';
    } else if(widget.jenis == '-') {
      textTampil = 'Pilih Kategori dan Jenis Laporan Terlebih Dahulu';
    } else if(widget.desc == true){
      textTampil = 'Deskripsikan Laporan ';
    }
    
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
              Text(
                'Jangan lupa mengisi dan memilih : ',
                style: blackTextStyle.copyWith(
                  fontSize: 15,
                  fontWeight: semibold
                ),
              ),
              const SizedBox(height: 10,),
              Text(
                textTampil,
                style: blackTextStyle.copyWith(
                  fontSize: 15,
                  fontWeight: regular
                ),
              ),
              const SizedBox(height: 16.0),
              Container(
                padding: const EdgeInsets.only(right: 30),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Tutup'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
