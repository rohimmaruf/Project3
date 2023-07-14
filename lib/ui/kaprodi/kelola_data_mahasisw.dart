import 'dart:convert';
import 'dart:ffi';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:project_3/shared/theme.dart';

class KelolaDataMahasiswa extends StatefulWidget {
  const KelolaDataMahasiswa({super.key});

  @override
  State<KelolaDataMahasiswa> createState() => _KelolaDataMahasiswaState();
}

class _KelolaDataMahasiswaState extends State<KelolaDataMahasiswa> {
  List<Map<String, dynamic>> listUser = [];
  bool Loading = true;

  @override
  void initState() {
    _getData();
    super.initState();
  }

  Future<void> _getData() async {
    print("INI fetching");
    var url = Uri.parse('http://192.168.1.4/mahasiswa/users/allUsers.php');
    var respone = await http.get(url);

    if (respone.statusCode == 200) {
      Map<String, dynamic> responseData = jsonDecode(respone.body);
      setState(() {
        listUser = List<Map<String, dynamic>>.from(responseData['data']);
        Loading = false;
      });
    } else {
      print('Failed to fetch data. Status code: ${respone.statusCode}');
    }

    // print('Ini data list user : $listUser');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightbacgroundColor,
      appBar: AppBar(
        title: const Text(
          'Daftar KKN & KKP',
        ),
        backgroundColor: orangeColor,
      ),
      body: ListView.builder(
          itemCount: listUser.length,
          itemBuilder: (context, index) {
            var user = listUser[index];
            var namaDepan = user["nama_depan"];
            var namaBelakang = user["nama_belakang"];
            var namaLengkap = "$namaDepan $namaBelakang";
            // print('ini user : $user');
            return Container(
              width: double.infinity,
              height: 220,
              margin: const EdgeInsets.only(
                top: 10,
                right: 10,
                left: 10,
              ),
              padding: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(28),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    'assets/card.png',
                  ),
                ),
              ),
              child: Column(
                // Membuat Text mulai darikiri terlebih dahulu
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "KKN / KKP",
                    style: blackTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: semibold,
                    ),
                  ),
                  // const SizedBox(
                  //   height: 28,
                  // ),
                  Text(
                    namaLengkap,
                    style: blackTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: semibold,
                      // membuat spasi
                    ),
                  ),
                  // const SizedBox(
                  //   height: 21,
                  // ),
                  Text(
                    user["jurusan"],
                    style: blackTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: semibold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Nama Perusahaan / Tempat Proyek KKn',
                    style: blackTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: semibold,
                    ),
                  ),
                  Text(
                    'Jl. Dipati ukurr Rt.01 rw.12 n0.4',
                    style: blackTextStyle.copyWith(
                      fontSize: 12,
                      fontWeight: semibold,
                    ),
                  ),

                  Text(
                    'Dospem : Iwan Bopeng',
                    style: blackTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: semibold,
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
