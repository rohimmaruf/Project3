import 'dart:async';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:project_3/shared/theme.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  // Membuat Page Loading
  @override
  void initState() {
    super.initState();
    // Untuk Mengatur berapa lama loading page
    Timer(const Duration(seconds: 2), () {
      Navigator.pushNamed(context, '/sign-in');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightbacgroundColor,
      body: Center(
        child: Container(
          width: 284,
          height: 235,
          decoration: const BoxDecoration(
              image:
                  DecorationImage(image: AssetImage('assets/logo_splash.png'))),
        ),
      ),
    );
  }
}
