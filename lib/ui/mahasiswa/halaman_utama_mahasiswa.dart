import 'package:flutter/material.dart';
import 'package:project_3/shared/local_storage.dart';
import 'dart:convert';
import 'package:project_3/shared/theme.dart';
import 'package:project_3/widget/list_menu.dart';
import 'package:http/http.dart' as http;

class HalamanUtamaMahasiswa extends StatefulWidget {
  const HalamanUtamaMahasiswa({super.key});

  @override
  State<HalamanUtamaMahasiswa> createState() => _HalamanUtamaState();
}

class _HalamanUtamaState extends State<HalamanUtamaMahasiswa> {
  List<Map<String, dynamic>> listKegiatan = [];
  Map<String, dynamic> myData = {};
  // Membuat Varible list data
  List listdata = ["1"];
  bool Loading = true;

  @override
  // 7. Untuk membuat jalan terlebih dahulu
  void initState() {
    super.initState();
    _getdata();
    // 8. Perintan print(listdata); untuk mengecek data tersebut sudah masuk atau belun
  }

  Future<void> _getdata() async {
    dynamic storedResponse = await LocalStorage.getResponseObject();

    // Objek response berhasil diambil dari local storage, gunakan sesuai kebutuhan
    // Misalnya, tampilkan nama pengguna:

    setState(() {
      myData = storedResponse;
      Loading = false;
    });
  }

  // Membuat Methode

  @override
  Widget build(BuildContext context) {
    // var user = listKegiatan[1];
    // var kegiatan = listKegiatan[0];
    print(myData);
    return Scaffold(
      body: Loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView(
              children: [
                judul(
                  myData["nama_depan"],
                ),
                subjudul(
                  myData["role"],
                  myData["mahasiswa_id"],
                ),
                menulist(context),
              ],
            ),
    );
  }
}

// Scaffold(
//       body: Loading
//           ? Center(
//               child: CircularProgressIndicator(),
//             )
//           : ListView(
//               children: [
//                 judul(
//                   myData["nama_depan"],
//                 ),
//                 subjudul(
//                   myData["role"],
//                   myData["mahasiswa_id"],
//                 ),
//                 menulist(context),
//               ],
//             ),
//     );

Widget judul(String namaDosen) {
  return Container(
    padding: EdgeInsets.all(30),
    width: 375,
    height: 188,
    decoration: BoxDecoration(
      borderRadius: const BorderRadius.only(
        // Cara membuar tradius hanya di bawah
        bottomLeft: Radius.circular(40),
        bottomRight: Radius.circular(40),
      ),
      color: orangeColor,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Selamat Datang,',
          style: blackTextStyle.copyWith(
            fontSize: 20,
            fontWeight: black,
          ),
        ),
        Text(
          namaDosen,
          // role,
          style: blackTextStyle.copyWith(
            fontSize: 18,
            fontWeight: black,
          ),
        ),
      ],
    ),
  );
}

Widget subjudul(String role, String user_id) {
  return Container(
    margin: const EdgeInsets.symmetric(
      horizontal: 24,
    ),
    padding: const EdgeInsets.only(
      top: 12,
      left: 24,
    ),
    width: 327,
    height: 86,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20), color: whiteColor),
    child: Column(
      children: [
        Row(
          children: [
            Column(
              children: [
                Text(
                  'Masuk Sebagai ',
                  style: blackTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: black,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  role,
                  // jurusan,
                  style: greyTextStyle.copyWith(
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 40,
            ),
            Text(
              user_id,
              style: blackTextStyle.copyWith(
                fontSize: 14,
                fontWeight: semibold,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget menulist(BuildContext context) {
  return Container(
    margin: const EdgeInsets.symmetric(
      horizontal: 24,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: Text(
            'Menu',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semibold,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            ListMenu(
              iconUrl: 'assets/logo_konsultasi.png',
              tittle: 'Data \n Diri',
              onTap: () {
                Navigator.pushNamed(context, '/halaman_profile');
              },
            ),
            const SizedBox(
              width: 5,
            ),
            ListMenu(
              iconUrl: 'assets/logo_report.png',
              tittle: 'Kegiatan \n KKP/KKN',
              onTap: () {
                Navigator.pushNamed(context, '/halaman_kegiatan');
              },
            )
          ],
        )
      ],
    ),
  );
}
