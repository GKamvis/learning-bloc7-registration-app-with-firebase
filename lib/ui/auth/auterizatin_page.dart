
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myapp/ui/auth/login_page.dart';
import 'package:myapp/ui/views/bottom_navigation.dart';


class AutherizationPage extends StatelessWidget {
  const AutherizationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return MyBottomNavigation();
          } else {
            return  const LoginPage();
          }
        },
      ),
    );
  }
}
