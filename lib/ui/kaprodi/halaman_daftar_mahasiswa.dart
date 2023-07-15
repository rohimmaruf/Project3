import 'dart:convert';
import 'dart:ffi';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:project_3/shared/local_storage.dart';
import 'package:project_3/shared/theme.dart';

class HalamanDataMahasiswa extends StatefulWidget {
  const HalamanDataMahasiswa({super.key});

  @override
  State<HalamanDataMahasiswa> createState() => _KelolaDataMahasiswaState();
}

class _KelolaDataMahasiswaState extends State<HalamanDataMahasiswa> {
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

    print(storedResponse);

    // Objek response berhasil diambil dari local storage, gunakan sesuai kebutuhan
    // Misalnya, tampilkan nama pengguna:
    String dosenId = storedResponse['mahasiswa_id'];
    print('Nama Pengguna: $dosenId');

    setState(() {
      myData = storedResponse;
    });

    var url = Uri.parse(
        'http://192.168.1.11/mahasiswa/users/allUsers.php');
    var response = await http.get(url);

    // bikion var respon = si respon.body jsonDecode menjadi Object
    Map<String, dynamic> responseData = jsonDecode(response.body);
    // Merubah variable listUser menjadi global
    //

    if (responseData["success"]) {
      print(responseData);
      setState(() {
        listKegiatan = List<Map<String, dynamic>>.from(responseData['data']);
        Loading = false;
      });
    } else {
      print("Belum ada data");
    }

    setState(() {
      // listKegiatan = List<Map<String, dynamic>>.from(responseData['data']);
      // Loading = false;
    });
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
          itemCount: listKegiatan.length,
          itemBuilder: (context, index) {
            var kegiatan = listKegiatan[index];
            print(kegiatan);
            var namaLengkap = kegiatan["nama_depan"] + " " + kegiatan["nama_belakang"];
            return Loading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Container(
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
                          namaLengkap,
                          style: blackTextStyle.copyWith(
                            fontSize: 14,
                            fontWeight: semibold,
                          ),
                        ),
                        // const SizedBox(
                        //   height: 28,
                        // ),
                        // const SizedBox(
                        //   height: 21,
                        // ),
                        Text(
                          kegiatan["role"],
                          style: blackTextStyle.copyWith(
                            fontSize: 14,
                            fontWeight: semibold,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          kegiatan["jurusan"],
                          style: blackTextStyle.copyWith(
                            fontSize: 18,
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
