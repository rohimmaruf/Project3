import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DataMahasiswa extends StatefulWidget {
  const DataMahasiswa({super.key});

  @override
  State<DataMahasiswa> createState() => _DataMahasiswaState();
}

class _DataMahasiswaState extends State<DataMahasiswa> {
  //1. Bikin Variable untuk simpan data
  List listdata = [];
  // 12. Bikin variable untuk loading
  bool Loading = true;
  //2. Bikin Methode
  Future _getdata() async {
    // 3. Buat untuk memanggil api yang ingin kita gunakan
    try {
      final respone = await http
          .get(Uri.parse('http://192.168.1.4/mahasiswa/users/login.php'));
      // 4. Juka si respon benar akan muncuk kode 200
      if (respone.statusCode == 200) {
        // 5. Kita Buat variable data = Json Decode karean di php encode
        final data = jsonDecode(respone.body);
        // 6. Kita buat set State
        setState(() {
          listdata = data;
          // 13. Jika data masuk maka si loading akan berhenti
          Loading = false;
        });
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  // 7. Untuk membuat jalan terlebih dahulu
  void initState() {
    _getdata();
    // 8. Perintan print(listdata); untuk mengecek data tersebut sudah masuk atau belun
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: Loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              // 9. Untuk menentukan panjang data yang akan di tampilkan dalam program
              itemCount: listdata.length,
              itemBuilder: ((context, index) {
                //10. Untuk Membuat card
                return Card(
                  child: ListTile(
                    title: Text(listdata[index]['user_id']),
                    subtitle: Text(listdata[index][['nama_depan']]),
                  ),
                );
              }),
            ),
    );
  }
}

// Scaffold( ListView.builder(
      
//     //   // 9. Untuk menentukan panjang data yang akan di tampilkan dalam program
//     //   itemCount: listdata.length,
//     //   itemBuilder: ((context, index) {
//     //     return Card(
//     //       //10. Untuk Membuat card
//     //       child: ListTile(
//     //         // 11. Data apa yang ingin di keluarkan
//     //         title: Text(listdata[index]['nama']),
//     //       ),
//     //     );
//     //   }),
//     // ),
//     // );
