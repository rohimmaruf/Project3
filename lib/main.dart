import 'package:flutter/material.dart';
import 'package:project_3/ui/SplashPage.dart';
import 'package:project_3/ui/daftarKkn1.dart';
import 'package:project_3/ui/dataDiriPage.dart';
import 'package:project_3/ui/dataMahasiswa.dart';
import 'package:project_3/ui/dospem/halaman_utama_dospem.dart';
import 'package:project_3/ui/form/formKkp.dart';
import 'package:project_3/ui/form/formkkn.dart';
import 'package:project_3/ui/form/formkkn2.dart';
import 'package:project_3/ui/formUji.dart';
import 'package:project_3/ui/homePageDosen.dart';
import 'package:project_3/ui/kaprodi/dosen_pembimbing.dart';
import 'package:project_3/ui/kaprodi/halaman_utama.dart';
import 'package:project_3/ui/kaprodi/kelola_data_mahasisw.dart';
import 'package:project_3/ui/kaprodi/pilih_dosen%20_pembimbing.dart';
import 'package:project_3/ui/mahasiswa/halaman_utama_mahasiswa.dart';
import 'package:project_3/ui/mahasiswa/kelola_data_diri.dart';
import 'package:project_3/ui/signInPage.dart';
import 'package:project_3/ui/succesPage.dart';
import 'package:project_3/ui/pilihKknKkpPage.dart';
import 'package:project_3/ui/succesPage2.dart';

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
        '/succes-page2': (context) => const SuccesPage2(),
        '/home-page-dosen': (context) => const HomePageDosen(),
        '/data-mahasiswa': (context) => const DataMahasiswa(),
        '/data-diri': (context) => const DataDiriPage(),
        '/ujicoba': (context) => const FormUji(),
        '/daftar-kkn1': (context) => const DaftarKkn1(),
        '/pilihdaftar': (context) => const PilihKkpKknPage(),
        '/formKkp': (context) => const FormKkp(),
        '/formKkn': (context) => const FormKkn(),
        '/formKkn2': (context) => const FormKkn2(),
        '/halaman_utama_kprodi': (context) => const HalamanUtamaKprodi(),
        '/kelola_data_mahasiswa': (context) => const KelolaDataMahasiswa(),
        '/dosen_pembimbing': (context) => const DosenPembimbing(),
        '/pilih_dosen_pembimbing': (context) => const PilihDosenPembimbing(),
        '/halaman_utama_mahasiswa': (context) => const HalamanUtamaMahasiswa(),
        '/kelola_data_diri': (context) => const KelolaDataDiri(),
        '/halaman_utama_dosen': (context) => const HalamanUtamaDospem(),
      },
    );
  }
}
