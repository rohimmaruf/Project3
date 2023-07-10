import 'package:flutter/material.dart';
import 'package:project_3/shared/theme.dart';
import 'package:project_3/widget/form.dart';
import 'package:project_3/widget/button.dart';
import 'package:http/http.dart' as http;

class DataDiriPage extends StatefulWidget {
  const DataDiriPage({super.key});

  @override
  State<DataDiriPage> createState() => _DataDiriPageState();
}

class _DataDiriPageState extends State<DataDiriPage> {
  // 3. Ini Kita buat Variable
  final formkey = GlobalKey<FormState>();
  // 1. Untuk meninput nama kita harud bikin controler
  final namadepan = TextEditingController(text: '');
  final namabelakang = TextEditingController(text: '');
  // 7. Kita bikin methode dalam variable simpan
  // 8. Pakai async karena kita menunggu
  _simpan() async {
    final respone =
        // 9. Bikin Metodenya karena kita ingin post data
        await http.post(Uri.parse('http://192.168.1.14/flutter_api/create.php'),
            // 10. Kita bikin apa yang mau dikirim
            body: {
          // 12. tidak perlu pakai . Text karena dia atas sudah kita buat dia menjadi text
          "namadepan": namadepan.text,
          "namabelakang": namabelakang.text,
        });
    // 11. Kita melakukan pengecekan
    if (respone.statusCode == 200) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Form Pendaftaran'),
      // ),
      body: ListView(
        // 4. List View atau form key sama dengan key
        key: formkey,
        padding: const EdgeInsets.symmetric(
          horizontal: 50,
        ),
        children: [
          Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 50,
              ),
              Text(
                'Masukan Data Anda \n& Data Untuk Pendukung',
                style: blackTextStyle.copyWith(
                  fontSize: 20,
                  fontWeight: semibold,
                ),
              ),
              const SizedBox(
                height: 51,
              ),
              Container(
                margin: const EdgeInsets.only(
                  right: 5,
                  left: 5,
                ),
                padding: const EdgeInsets.all(20),
                // decoration: BoxDecoration(
                //   borderRadius: BorderRadius.circular(20),
                //   color: whiteColor,
                // ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: whiteColor,
                ),
                child: Column(
                  children: [
                    // 2. Kita ubah si name controller ini jadi ncontroller yng kita buat di atas
                    CustomField(
                      title: 'Nama Depan',
                      controller: namadepan,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomField(
                      title: 'Nama Belakang',
                      controller: namabelakang,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const CustomField(title: 'Nim'),
                    const SizedBox(
                      height: 20,
                    ),
                    const CustomField(title: 'Jurusan'),
                    const SizedBox(
                      height: 50,
                    ),
                    CustomFilledButton(
                      tittle: 'Lanjut',
                      onPressed: () {
                        Navigator.pushNamed(context, '/pilihdaftar');
                        // 5. Setalhnya kita buat kocdisi juka formkey .validasi == simpan
                        if (formkey.currentState!.validate()) {
                          // 6. Setealah itu kita buat si simpan tersebus dalam value
                          // 13. Kita sudah dapat kondisi yang sudah kita buat di atas
                          _simpan().then((value) {
                            // 14. Jika benar maka akan muncul nontifikasi
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
        ],
      ),
    );
  }
}

// Cara membua hint
// TextFormField(
//   Decoration: InputDecoration(
//     hintText: 'Masukan data'
//   ),
// )
