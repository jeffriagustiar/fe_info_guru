import 'package:fe_info_guru/pages/home/home_page.dart';
import 'package:fe_info_guru/pages/sign_in.dart';
import 'package:fe_info_guru/pages/splash_page.dart';
import 'package:fe_info_guru/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:sp_util/sp_util.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SpUtil.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/' :(context) => const SplashPage(),
          '/sign-in' :(context) => Sign_In(),
          '/home' :(context) => const HomePage(),
        },
      ),
    );
  }
}