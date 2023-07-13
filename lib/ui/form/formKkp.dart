import 'package:flutter/material.dart';
import 'package:project_3/shared/theme.dart';
import 'package:project_3/widget/form.dart';
import 'package:project_3/widget/button.dart';
import 'package:project_3/widget/form_date.dart';

class FormKkp extends StatefulWidget {
  const FormKkp({super.key});

  @override
  State<FormKkp> createState() => _FormKkpState();
}

class _FormKkpState extends State<FormKkp> {
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
                  title: 'Nama Perusahaan',
                ),
                const SizedBox(
                  height: 20,
                ),
                const CustomField3(
                  title: 'Alamat Perusahaan',
                ),
                const SizedBox(
                  height: 20,
                ),
                const CustomField(
                  title: 'Bidang Kerja',
                ),
                const SizedBox(
                  height: 20,
                ),
                const CustomField(
                  title: 'Nama Pembimbing Lapangan',
                ),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  height: 50,
                ),
                CustomFilledButton(
                  tittle: 'Daftar',
                  onPressed: () {
                    Navigator.pushNamed(context, '/succes-page2');
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
