import 'dart:convert';
import 'dart:ffi';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:project_3/shared/theme.dart';

class PilihDosenPembimbing extends StatefulWidget {
  const PilihDosenPembimbing({super.key});

  @override
  State<PilihDosenPembimbing> createState() => _PilihDosenPembimbingState();
}

class _PilihDosenPembimbingState extends State<PilihDosenPembimbing> {
  List<Map<String, dynamic>> listDosen = [];

  @override
  void initState() {
    _getData();
    super.initState();
  }

  Future<void> _getData() async {
    var url = Uri.parse('http://192.168.1.4/mahasiswa/dosen/allDosens.php');
    var respone = await http.get(url);
    // print(respone.body);
    if (respone.statusCode == 200) {
      final dataJson = jsonDecode(respone.body);
      // print(dataJson);
      setState(() {
        listDosen = List<Map<String, dynamic>>.from(dataJson['data']);
        print(listDosen);
      });
    }
  }

  _simpan() async {
    final respone = await http.post(
      Uri.parse(
          'http://localhost/mahasiswa/kegiatan/update.php?kegiatan_id=64b1b019df6c9'),
      body: {
        // "dosen_id"  :,
        // "nama_dosen" :,
      },
    );
    if (respone == 200) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: orangeColor,
        title: Text('Pilih Nama Dosen pembimbing'),
      ),
      body: ListView.builder(
          itemCount: listDosen.length,
          itemBuilder: (context, index) {
            var dosen = listDosen[index];
            var namaDosen = dosen["nama_dosen"];
            print(dosen);
            return Container(
              child: TextButton(
                // MembUast text button
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                ),
                // Saat di klik menuju ke halaman signInPage
                onPressed: () {},
                child: Text(
                  namaDosen,
                  style: greyTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: regular,
                  ),
                ),
              ),
            );
          }),
    );
  }
}
