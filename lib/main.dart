import 'package:flutter/material.dart';
import 'package:project_3/ui/SplashPage.dart';
import 'package:project_3/ui/daftarKkn1.dart';
import 'package:project_3/ui/dataDiriPage.dart';
import 'package:project_3/ui/dataMahasiswa.dart';
import 'package:project_3/ui/form/formKkp.dart';
import 'package:project_3/ui/form/formkkn.dart';
import 'package:project_3/ui/form/formkkn2.dart';
import 'package:project_3/ui/formUji.dart';
import 'package:project_3/ui/homePageDosen.dart';
import 'package:project_3/ui/signInPage.dart';
import 'package:project_3/ui/succesPage.dart';
import 'package:project_3/ui/pilihKknKkpPage.dart';

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
        '/ujicoba': (context) => const FormUji(),
        '/daftar-kkn1': (context) => const DaftarKkn1(),
        '/pilihdaftar': (context) => const PilihKkpKknPage(),
        '/formKkp': (context) => const FormKkp(),
        '/formKkn': (context) => const FormKkn(),
        '/formKkn2': (context) => const FormKkn2(),
      },
    );
  }
}
