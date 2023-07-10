import 'package:flutter/material.dart';
import 'package:project_3/shared/theme.dart';
import 'package:project_3/widget/form.dart';
import 'package:project_3/widget/button.dart';
import 'package:http/http.dart' as http;

class DaftarKkn1 extends StatefulWidget {
  const DaftarKkn1({super.key});

  @override
  State<DaftarKkn1> createState() => _DaftarKkn1State();
}

class _DaftarKkn1State extends State<DaftarKkn1> {
  final formkey = GlobalKey<FormState>();
  final namaketua = TextEditingController(text: '');
  final namaanggota1 = TextEditingController(text: '');
  final namaanggota2 = TextEditingController(text: '');
  final namaanggota3 = TextEditingController(text: '');
  _simpan() async {
    final respone = await http
        .post(Uri.parse('http://192.168.43.1/flutter_api/create.php'), body: {
      "namaketua": namaketua.text,
      "namaanggota1": namaanggota1.text,
      "namaanggota2": namaanggota2.text,
      "namaamggota3": namaanggota3.text,
    });
    if (respone.statusCode == 200) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data KKN'),
      ),
      body: Form(
        key: formkey,
        child: Container(
          // Untuk Membuat Text Pada ketengah
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
          ),
          margin: EdgeInsets.only(
            top: 41,
          ),
          child: Column(
            children: [
              Text(
                'Masukan Data Anda \n& Data Untuk Pendukung',
                style: blackTextStyle.copyWith(
                  fontSize: 20,
                  fontWeight: semibold,
                ),
                textAlign: TextAlign.center,
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
                      title: 'Nama Ketua',
                      controller: namaketua,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    CustomField(
                      title: 'Anggota 1',
                      controller: namaanggota1,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    CustomField(
                      title: 'Anggota 2',
                      controller: namaanggota2,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    CustomField(
                      title: 'Anggota 3',
                      controller: namaanggota3,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    CustomFilledButton(
                      tittle: 'Lanjut',
                      onPressed: () {
                        if (formkey.currentState!.validate()) {
                          _simpan().then((value) {
                            if (value) {
                              final snackBar = SnackBar(
                                content: const Text('Data Berhasil Di Dimpan'),
                              );
                              // 15. Kita tampilkan si snackbar
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            } else {
                              final snackBar = SnackBar(
                                content: const Text('Data Gagal Di Dimpan'),
                              );
                              // 16. Kita tampilkan si snackbar
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            }
                          });
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
