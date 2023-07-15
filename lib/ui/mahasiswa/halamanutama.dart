import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:project_3/shared/theme.dart';
import 'package:project_3/widget/list_menu.dart';
import 'package:http/http.dart' as http;
import 'package:project_3/shared/local_storage.dart';

class HalamanUtama extends StatefulWidget {
  const HalamanUtama({super.key});

  @override
  State<HalamanUtama> createState() => _HalamanUtamaState();
}

class _HalamanUtamaState extends State<HalamanUtama> {
  // Membuat Varible list data
  List listdata = [];
  Map<String, dynamic> dataUser = {};
  bool Loading = false;

  @override
  // 7. Untuk membuat jalan terlebih dahulu
  void initState() {
    // 8. Perintan print(listdata); untuk mengecek data tersebut sudah masuk atau belun
    super.initState();
    fetchData();
  }

  // Membuat Methode
  Future<void> fetchData() async {
    print("GET BERHASIL");

// Di tempat lain dalam aplikasi, misalnya pada halaman profil pengguna
    dynamic storedResponse = await LocalStorage.getResponseObject();

    if (storedResponse != null) {
      // Objek response berhasil diambil dari local storage, gunakan sesuai kebutuhan
      // Misalnya, tampilkan nama pengguna:
      print('Nama Pengguna: $storedResponse');
      setState(() {
        dataUser = storedResponse;
      });
    } else {
      // Objek response tidak tersedia di local storage
      print('Objek response tidak tersedia.');
    }

    // var url = Uri.parse(
    //     'http://192.168.1.11/mahasiswa/users/allUsers.php?role=mahasiswa');
    // var response = await http.get(url);

    // if (response.statusCode == 200) {
    //   Map<String, dynamic> responseData = jsonDecode(response.body);
    //   setState(() {
    //     // products = List<Map<String, dynamic>>.from(responseData['data']);
    //   });
    // } else {
    //   print('Failed to fetch data. Status code: ${response.statusCode}');
    // }
  }

  @override
  Widget build(BuildContext context) {
    print(dataUser);
    var namaLengkap = dataUser["nama_depan"] + " " + dataUser["nama_belakang"];
    var jurusan = dataUser["jurusan"];
    return Scaffold(
      body: ListView(
        children: [
          judul(namaLengkap),
          subjudul(jurusan),
          menulist(context),
          FloatingActionButton(onPressed: fetchData)
        ],
      ),
      // children: [
      //   judul(),
      //   const SizedBox(
      //     height: 10,
      //   ),
      //   subjudul(),
      //   const SizedBox(
      //     height: 10,
      //   ),
      //   menulist(),
      // ],
    );
  }
}

Widget judul(String namaLengkap) {
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
          namaLengkap,
          style: blackTextStyle.copyWith(
            fontSize: 18,
            fontWeight: black,
          ),
        ),
      ],
    ),
  );
}

Widget subjudul(String jurusan) {
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
                  'Prodi & Konsentrasi',
                  style: blackTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: black,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  jurusan,
                  style: greyTextStyle.copyWith(
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 150,
            ),
            // Text(
            //   '1119110050',
            //   style: blackTextStyle.copyWith(
            //     fontSize: 14,
            //     fontWeight: semibold,
            //   ),
            // ),
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
              iconUrl: 'assets/logo_programkerja.png',
              tittle: 'Program \n Kerja',
              onTap: () {},
            ),
            const SizedBox(
              width: 16,
            ),
            ListMenu(
              iconUrl: 'assets/logo_durasikegiatan.png',
              tittle: 'Konsultasi \n Dosen',
              onTap: () {
                Navigator.pushNamed(context,"/konsultasi-dosen");
              },
            ),
            const SizedBox(
              width: 16,
            ),
            ListMenu(
              iconUrl: 'assets/logo_programkerja.png',
              tittle: 'Duarasi \n Kegiatan',
              onTap: () {},
            ),
            const SizedBox(
              width: 16,
            ),
            ListMenu(
              iconUrl: 'assets/logo_programkerja.png',
              tittle: 'Data \n Kelompok',
              onTap: () {},
            ),
          ],
        )
      ],
    ),
  );
}
