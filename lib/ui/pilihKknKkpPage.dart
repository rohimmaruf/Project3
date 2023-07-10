import 'package:flutter/material.dart';
import 'package:project_3/shared/theme.dart';
import 'package:project_3/widget/button.dart';

class PilihKkpKknPage extends StatelessWidget {
  const PilihKkpKknPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // harus menggunakan body agar bewana abuu abu
      body: ListView(
        // Jarak dari pinggir ke dalam konten
        padding: EdgeInsets.symmetric(
          horizontal: 24,
        ),
        children: [
          const SizedBox(
            height: 56,
          ),
          Text(
            'Pilih Yang Ingin Kamu \n Daftar',
            style: blackTextStyle.copyWith(
              fontSize: 20,
              fontWeight: semibold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 58,
          ),
          // Image dibungkus oleh containerr agar mudah untuk mengatur lebar dan tinggi gambar
          Container(
            height: 127,
            child: Image(
              image: AssetImage('assets/kkp1.png'),
            ),
          ),
          const SizedBox(
            height: 27,
          ),
          CustomFilledButton(
            tittle: 'KKP',
            onPressed: () {
              Navigator.pushNamed(context, '/formKkp');
            },
          ),
          const SizedBox(
            height: 80,
          ),
          Container(
            height: 161,
            child: Image(
              image: AssetImage('assets/kkn1.png'),
            ),
          ),
          const SizedBox(
            height: 27,
          ),
          CustomFilledButton(
            tittle: 'KKN',
            onPressed: () {
              Navigator.pushNamed(context, '/formKkn');
            },
          ),
        ],
      ),
    );
  }
}
