import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:project_3/shared/theme.dart';
import 'package:project_3/widget/list_menu.dart';
import 'package:http/http.dart' as http;

class HalamanUtama extends StatefulWidget {
  const HalamanUtama({super.key});

  @override
  State<HalamanUtama> createState() => _HalamanUtamaState();
}

class _HalamanUtamaState extends State<HalamanUtama> {
  // Membuat Varible list data
  List listdata = [];
  bool Loading = false;
  // Membuat Methode
  Future _getdata() async {
    // 3. Buat untuk memanggil api yang ingin kita gunakan
    try {
      final respone = await http
          .get(Uri.parse('http://192.168.1.4/mahasiswa/users/allUsers.php'));
      // 4. Juka si respon benar akan muncuk kode 200
      if (respone.statusCode == 200) {
        // 5. Kita Buat variable data = Json Decode karean di php encode
        final data = jsonDecode(respone.body);
        // 6. Kita buat set State
        setState(() {
          listdata = data;
          // 13. Jika data masuk maka si loading akan berhenti
          Loading;
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
        body: Loading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: listdata.length,
                itemBuilder: ((context, index) {
                  //10. Untuk Membuat card
                  return Card(
                    child: ListTile(
                      title: Text(listdata[index]['user_id']),
                      subtitle: Text(listdata[index]['nama_depan']),
                    ),
                  );
                }),
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
              ));
  }
}

Widget judul() {
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
          'Rohim Maruf',
          style: blackTextStyle.copyWith(
            fontSize: 18,
            fontWeight: black,
          ),
        ),
      ],
    ),
  );
}

Widget subjudul() {
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
                  'Teknik Informatika',
                  style: greyTextStyle.copyWith(
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 150,
            ),
            Text(
              '1119110050',
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

Widget menulist() {
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
              onTap: () {},
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
