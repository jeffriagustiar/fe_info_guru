// ignore_for_file: use_key_in_widget_constructors

import 'package:fe_info_guru/pages/home/home_page.dart';
import 'package:fe_info_guru/providers/auth_provider.dart';
import 'package:fe_info_guru/share/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: camel_case_types
class Sign_In extends StatefulWidget {
  @override
  State<Sign_In> createState() => _Sign_InState();
}

// ignore: camel_case_types
class _Sign_InState extends State<Sign_In> {
  // const Sign_In({super.key});
  TextEditingController nipController = TextEditingController(text: '');

  TextEditingController passwordController = TextEditingController(text: '');

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {

    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    handleSignIn() async{

      setState(() {
        isLoading = true;
      });

      if(
        await authProvider.login( 
          nip: nipController.text, 
          password: passwordController.text
        )
        ){
          // ignore: use_build_context_synchronously
          Navigator.pushAndRemoveUntil(
            context, 
            MaterialPageRoute(
              builder: (context) => const HomePage(),
            ), 
            ModalRoute.withName('/home')
          );
          // print(a);
        }else{
          // ignore: use_build_context_synchronously
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: alertColor,
              content: const Text(
                "Gagal Login",
                textAlign: TextAlign.center,
              )
            )
          );
        }

        setState(() {
          isLoading = false;
        });
    }


    Widget emailInput() {
      return Container(
        margin: const EdgeInsets.only(top: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'NIP',
              style:
                  blackTextStyle.copyWith(fontWeight: medium, fontSize: 16),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                    color: background4Color,
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
                          controller: nipController,
                          decoration: InputDecoration.collapsed(
                            hintText: 'NIP Kamu',
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

    Widget passwordInput() {
      return Container(
        margin: const EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Password',
              style:
                  blackTextStyle.copyWith(fontWeight: medium, fontSize: 16),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                    color: background4Color,
                    borderRadius: BorderRadius.circular(12)),
                    child: Center(
                      child: Row(
                        children: [
                          const Icon(
                            Icons.key,
                            color: Colors.blue,
                          ),
                          const SizedBox(width: 15,),
                          Expanded(
                            child: TextFormField(
                              obscureText: true,
                              style: blackTextStyle,
                              controller: passwordController,
                              decoration: InputDecoration.collapsed(
                                hintText: 'Password kamu',
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

    Widget buttom() {
      return Container(
        height: 50,
        width: double.infinity,
        margin: const EdgeInsets.only(top: 30),
        child: TextButton(
            style: TextButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12))),
            onPressed: handleSignIn,
            child: Text(
              'Sign In',
              style:
                  primaryTextStyle.copyWith(fontWeight: medium, fontSize: 16),
            )),
      );
    }

    Widget logo(){
      return Center(
        child: Container(
          margin: const EdgeInsets.only(top: 40),
          width: 100,
          height: 100,
          decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/logo.png'))
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ListView(
                  children: [
                    // header(),
                    logo(),
                    emailInput(),
                    passwordInput(),
                    buttom(),
                  ],
                )
              ),
              // const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}