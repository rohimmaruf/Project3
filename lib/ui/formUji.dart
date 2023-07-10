import 'package:flutter/material.dart';
import 'package:project_3/shared/theme.dart';
import 'package:http/http.dart' as http;
import 'package:project_3/widget/form.dart';

class FormUji extends StatefulWidget {
  const FormUji({super.key});

  @override
  State<FormUji> createState() => _FormUjiState();
}

class _FormUjiState extends State<FormUji> {
  final formkey = GlobalKey<FormState>();
  TextEditingController namadepan = TextEditingController();
  final namabelakang = TextEditingController(text: '');
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
      appBar: AppBar(
        title: Text('Isi Data '),
      ),
      body: Form(
        key: formkey,
        child: Column(
          children: [
            const SizedBox(height: 20),
            TextFormField(
              controller: namadepan,
              decoration: InputDecoration(
                hintText: "Nama Depan",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            CustomField(
              controller: namabelakang,
              title: 'Nama Belakang',
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
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
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    } else {
                      final snackBar = SnackBar(
                        content: const Text('Data Gagal Di Dimpan'),
                      );
                      // 16. Kita tampilkan si snackbar
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  });
                }
              },
              child: Text('Simpan'),
            )
          ],
        ),
      ),
    );
  }
}
