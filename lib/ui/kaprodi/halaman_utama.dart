import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:project_3/shared/theme.dart';
import 'package:project_3/widget/list_menu.dart';
import 'package:http/http.dart' as http;
import 'package:project_3/shared/local_storage.dart';

class HalamanUtamaKprodi extends StatefulWidget {
  const HalamanUtamaKprodi({super.key});

  @override
  State<HalamanUtamaKprodi> createState() => _HalamanUtamaState();
}

class _HalamanUtamaState extends State<HalamanUtamaKprodi> {
  List<Map<String, dynamic>> listUsers = [];
  // Membuat Varible list data
  List listdata = ["1"];
  bool Loading = false;

  @override
  // 7. Untuk membuat jalan terlebih dahulu
  void initState() {
    super.initState();
    fetchData();
    // 8. Perintan print(listdata); untuk mengecek data tersebut sudah masuk atau belun
  }

  Future<void> fetchData() async {
    print("GET BERHASIL");
    // Di tempat lain dalam aplikasi, misalnya pada halaman profil pengguna
    dynamic storedResponse = await LocalStorage.getResponseObject();


    if (storedResponse != null) {
      // Objek response berhasil diambil dari local storage, gunakan sesuai kebutuhan
      // Misalnya, tampilkan nama pengguna:
      String userName = storedResponse['nama_depan'];
      print('Nama Pengguna: $storedResponse');
    } else {
      // Objek response tidak tersedia di local storage
      print('Objek response tidak tersedia.');
    }


    var url = Uri.parse(
        'http://192.168.1.11/mahasiswa/users/allUsers.php?role=mahasiswa');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      Map<String, dynamic> responseData = jsonDecode(response.body);
      setState(() {
        listUsers = List<Map<String, dynamic>>.from(responseData['data']);
      });
    } else {
      print('Failed to fetch data. Status code: ${response.statusCode}');
    }
  }

  // Membuat Methode

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: listUsers.length,
        itemBuilder: (context, index) {
          var user = listUsers[index];
          var namaLengkap = user["nama_depan"] + ' ' + user["nama_belakang"];
          return Column(
            children: [
              Text(namaLengkap),
              // judul(
              //   user["role"],
              // ),
              subjudul(
                user["jurusan"],
                user["mahasiswa_id"],
              ),
              // menulist(context),
            ],
          );
        },
      ),
    );
  }
}

Widget judul(String role) {
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
          role,
          style: blackTextStyle.copyWith(
            fontSize: 18,
            fontWeight: black,
          ),
        ),
      ],
    ),
  );
}

Widget subjudul(String jurusan, String user_id) {
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
              iconUrl: 'assets/logo_programkerja.png',
              tittle: 'Kelola Data \n KKN & KKP ',
              onTap: () {
                Navigator.pushNamed(context, '/kelola_data_mahasiswa');
              },
            ),
            const SizedBox(
              width: 5,
            ),
            ListMenu(
              iconUrl: 'assets/logo_durasikegiatan.png',
              tittle: 'Konsultasi \n Dosen',
              onTap: () {},
            ),
            const SizedBox(
              width: 5,
            ),
            ListMenu(
              iconUrl: 'assets/logo_programkerja.png',
              tittle: 'Duarasi \n Kegiatan',
              onTap: () {},
            ),
            const SizedBox(
              width: 5,
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
