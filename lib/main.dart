import 'package:flutter/material.dart';
import 'package:project_3/ui/SplashPage.dart';
import 'package:project_3/ui/dataDiriPage.dart';
import 'package:project_3/ui/dataMahasiswa.dart';
import 'package:project_3/ui/homePageDosen.dart';
import 'package:project_3/ui/signInPage.dart';
import 'package:project_3/ui/succesPage.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const SplashPage(),
        '/sign-in': (context) => const SignInPage(),
        '/succes-page': (context) => const SuccesPage(),
        '/home-page-dosen': (context) => const HomePageDosen(),
        '/data-mahasiswa': (context) => const DataMahasiswa(),
        '/data-diri': (context) => const DataDiriPage(),
      },
    );
  }
}
