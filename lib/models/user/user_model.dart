class UserModel{
  late int? replid;
  late String? login;
  late String? password;
  // ignore: non_constant_identifier_names
  late String? api_token;
  late int? level;
  late String? kelola;

  UserModel({
    required this.replid,
    required this.login,
    required this.password,
    // ignore: non_constant_identifier_names
    required this.api_token,
    required this.level,
    required this.kelola
  });

  factory UserModel.fromJson(Map<String, dynamic> json){
    return UserModel(
      replid: json['replid'], 
      login: json['login'], 
      password: json['password'], 
      api_token: json['api_token'], 
      level: json['level'], 
      kelola: json['kelola']
    );
  }

  Map<String, dynamic> toJson(){
    return {
      'replid' : replid,
      'login' : login,
      'password' : password,
      'api_token' : api_token,
      'level' : level,
      'kelola' : kelola,
    };
  }
}