
import 'package:fe_info_guru/models/profile/profile_model.dart';
import 'package:fe_info_guru/services/profile_service.dart';
import 'package:flutter/material.dart';

class ProfileProvider with ChangeNotifier{
  late ProfileModel _profile = ProfileModel(
    nama: 'a'
  );

  ProfileModel get profile => _profile;

  set profile (ProfileModel profile){
    _profile = profile;
    notifyListeners();
  }

  Future<void> getProfile() async{
    try {
      ProfileModel profile = await ProfileService().getProfile();
      _profile = profile; 
    } catch (e) {
      // ignore: avoid_print
      print(e); 
    }
  }
}