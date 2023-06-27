import 'package:flutter/material.dart';
import 'package:project_3/shared/theme.dart';
import 'package:project_3/widget/form.dart';
import 'package:project_3/widget/button.dart';

class DataDiriPage extends StatefulWidget {
  const DataDiriPage({super.key});

  @override
  State<DataDiriPage> createState() => _DataDiriPageState();
}

class _DataDiriPageState extends State<DataDiriPage> {
  // 3. Ini Kita buat Variable
  final formkey = GlobalKey<FormState>();
  // 1. Untuk meninput nama kita harud bikin controler
  final namefristcontroler = TextEditingController(text: '');
  final namelastcontroler = TextEditingController(text: '');
  _simpan() {}

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
                margin: EdgeInsets.only(
                  right: 5,
                  left: 5,
                ),
                padding: EdgeInsets.all(20),
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
                      controller: namefristcontroler,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomField(
                      title: 'Nama Belakang',
                      controller: namelastcontroler,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomField(title: 'Nim'),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomField(title: 'Jurusan'),
                    const SizedBox(
                      height: 50,
                    ),
                    CustomFilledButton(
                      tittle: 'Lanjut',
                      onPressed: () {
                        // 4. Setalhnya kita buat kocdisi juka formkey .validasi == simpan
                        if (formkey.currentState!.validate()) {
                          // 5. Setealah itu kita buat si simpan tersebus dalam value
                          _simpan();
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


