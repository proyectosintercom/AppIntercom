
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutterfire_ui/auth.dart';

import 'package:animate_do/animate_do.dart';
class PaginaLogin extends StatefulWidget{
  const PaginaLogin({Key? key}) : super(key: key);

  static Widget create(BuildContext context) => const PaginaLogin();



  @override
  PaginaLoginState createState() => PaginaLoginState();
}

class PaginaLoginState extends State<PaginaLogin> {

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        return SignInScreen(
          providerConfigs: [
            EmailProviderConfiguration(),
            GoogleProviderConfiguration(clientId: '5122163078-i4rlqjcjf4d2u2nk2j2at1bqinjo3dd9.apps.googleusercontent.com')
            
          ],
        );
      },
    );
  }

}