import 'package:flutter/material.dart';
import 'package:project_3/shared/theme.dart';
import 'package:project_3/widget/form.dart';
import 'package:project_3/widget/button.dart';

class FormKkn extends StatefulWidget {
  const FormKkn({super.key});

  @override
  State<FormKkn> createState() => _FormKknState();
}

class _FormKknState extends State<FormKkn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: 24,
        ),
        children: [
          const SizedBox(
            height: 50,
          ),
          Text(
            'Masukan Data Anda \n & Data Untuk Pendukung',
            style: blackTextStyle.copyWith(
              fontSize: 20,
              fontWeight: semibold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 51,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: whiteColor,
            ),
            padding: const EdgeInsets.all(22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomField(
                  title: 'Nama Ketua',
                ),
                const SizedBox(
                  height: 20,
                ),
                const CustomField(
                  title: 'Nama Anggota 1',
                ),
                const SizedBox(
                  height: 20,
                ),
                const CustomField(
                  title: 'Nama Anggota 2',
                ),
                const SizedBox(
                  height: 20,
                ),
                const CustomField(
                  title: 'Nama Anggota 3',
                ),
                const SizedBox(
                  height: 50,
                ),
                CustomFilledButton(
                  tittle: 'Lanjut',
                  onPressed: () {
                    Navigator.pushNamed(context, '/formKkn2');
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
