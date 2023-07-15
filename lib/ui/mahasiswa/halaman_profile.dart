import 'dart:convert';
import 'dart:ffi';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:project_3/shared/local_storage.dart';
import 'package:project_3/shared/theme.dart';

class HalamanProfile extends StatefulWidget {
  const HalamanProfile({super.key});

  @override
  State<HalamanProfile> createState() => _KelolaDataMahasiswaState();
}

class _KelolaDataMahasiswaState extends State<HalamanProfile> {
  List<Map<String, dynamic>> listKegiatan = [{}];
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

    setState(() {
      myData = storedResponse;
      Loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightbacgroundColor,
      appBar: AppBar(
        title: const Text(
          'Halaman Profile',
        ),
        backgroundColor: orangeColor,
      ),
      body: ListView.builder(
          itemCount: listKegiatan.length,
          itemBuilder: (context, index) {
            var kegiatan = listKegiatan[index];
            var namaLengkap =
                myData["nama_depan"] + " " + myData["nama_belakang"];
                print("data: $myData");
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
                    padding: const EdgeInsets.all(20),
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
                            fontSize: 24,
                            fontWeight: semibold,
                          ),
                        ),
                        // const SizedBox(
                        //   height: 28,
                        // ),
                        Text(
                          myData["mahasiswa_id"],
                          style: blackTextStyle.copyWith(
                            fontSize: 18,
                            fontWeight: semibold,
                            // membuat spasi
                          ),
                        ),
                        Text(myData["role"]),
                        const SizedBox(
                          height: 21,
                        ),
                        Text(
                          myData["jurusan"],
                          style: blackTextStyle.copyWith(
                            fontSize: 18,
                            fontWeight: semibold,
                          ),
                        )
                      ],
                    ),
                  );
          }),
    );
  }
}
