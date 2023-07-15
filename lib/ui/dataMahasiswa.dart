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
  List<Map<String, dynamic>> listdata = [];
  // 12. Bikin variable untuk loading
  bool Loading = true;
  //2. Bikin Methode
  Future<void> _getdata() async {
    var url = Uri.parse('http://192.168.1.11/mahasiswa/kegiatan/allKegiatans.php');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      Map<String, dynamic> responseData = jsonDecode(response.body);
      setState(() {
        listdata = List<Map<String, dynamic>>.from(responseData['data']);
        Loading = false;
      });
    } else {
      print('Failed to fetch data. Status code: ${response.statusCode}');
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
    print(listdata);
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
                var data = listdata[index];
                return Card(
                  child: ListTile(
                    title: Text(data['mahasiswa_id']),
                    subtitle: Text(data['nama_depan']),
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
