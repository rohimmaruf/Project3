import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:project_3/shared/theme.dart';
import 'package:project_3/widget/form.dart';
import 'package:project_3/widget/button.dart';
import 'package:http/http.dart' as http;

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final formkey = GlobalKey<FormState>();
  final id_controller = TextEditingController(text: '2023000002');
  final password_controller = TextEditingController(text: 'dosen');
  _simpan() async {
    print(id_controller);
    final respone = await http.post(
        Uri.parse('http://192.168.1.4/mahasiswa/users/login.php'),
        body: jsonEncode({
          "user_id": id_controller.text,
          "password": password_controller.text,
        }));

    var body = jsonDecode(respone.body);
    print(body);
    // Negecek sudah bnar atau belum untuk ambil object
    print(body["success"]);
    // print(body["data"]["role"]);
    // Untuk kondisi jika dia benar apa jika salah
    if (body["success"]) {
      // print("kerja bagus");
      final snackBar = SnackBar(
        content: Text(body["message"]),
      );
      // 16. Kita tampilkan si snackbar
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      Navigator.pushNamed(context, '/halaman_utama_kprodi');
    } else {
      // print("salah");
      final snackBar = SnackBar(
        content: const Text('Masukan kembali Nomor induk & Sandi yang Benar'),
      );
      // 16. Kita tampilkan si snackbar
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }

    // return (respone);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        key: formkey,
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        children: [
          Container(
            width: 155,
            height: 155,
            margin: const EdgeInsets.only(
              top: 100,
              bottom: 80,
            ),
            decoration: const BoxDecoration(
              image:
                  DecorationImage(image: AssetImage('assets/logo_masuk.png')),
            ),
          ),
          Text(
            'Masuk &\nMulai KKN KKP',
            style: blackTextStyle.copyWith(
              fontSize: 20,
              fontWeight: semibold,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            padding: EdgeInsets.all(22),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: whiteColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomField(
                  title: 'Nomor induk',
                  controller: id_controller,
                ),
                const SizedBox(
                  height: 16,
                ),
                CustomField(
                  title: 'Masukan Sandi',
                  controller: password_controller,
                  obscureText: true,
                ),
                const SizedBox(
                  height: 16,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Lupa sandi? ',
                    style: blueTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: regular,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomFilledButton(
                  tittle: 'Masuk',
                  onPressed: () {
                    _simpan();
                    // _simpan().then(
                    //   (value) {
                    //     print(value);
                    //   },
                    // );
                    // Navigator.pushNamed(context, '/succes-page');
                  },
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 35,
          ),
          CustomTextButton(
            tittle: 'Form Daftar KKN & KKP',
            onPressed: () {
              Navigator.pushNamed(
                context,
                '/data-diri',
              );
            },
          ),
        ],
      ),
    );
  }
}
