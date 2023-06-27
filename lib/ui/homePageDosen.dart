import 'package:flutter/material.dart';
import 'package:project_3/shared/theme.dart';
import 'package:project_3/widget/button.dart';

class HomePageDosen extends StatefulWidget {
  const HomePageDosen({super.key});

  @override
  State<HomePageDosen> createState() => _HomePageDosenState();
}

class _HomePageDosenState extends State<HomePageDosen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Halaman Dosen',
            style: blackTextStyle.copyWith(
              fontSize: 20,
              fontWeight: medium,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          CustomFilledButton(
            tittle: 'Data mahasiswa',
            width: 180,
            onPressed: () {
              Navigator.pushNamed(context, '/data-mahasiswa');
            },
          ),
        ],
      )),
    );
  }
}
