import 'package:flutter/material.dart';
import 'package:project_3/shared/local_storage.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class KonsultasiDosen extends StatefulWidget {
  const KonsultasiDosen({super.key});

  @override
  State<KonsultasiDosen> createState() => _KonsultasiDosenState();
}

class _KonsultasiDosenState extends State<KonsultasiDosen> {
  Map<String, dynamic> kegiatan = {};

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
    String mahasiswaId = "";

    if (storedResponse != null) {
      // Objek response berhasil diambil dari local storage, gunakan sesuai kebutuhan
      // Misalnya, tampilkan nama pengguna:
      print('Nama Pengguna: $storedResponse');
      setState(() {
        // dataUser = storedResponse;
        mahasiswaId = storedResponse["mahasiswa_id"];
      });
    } else {
      // Objek response tidak tersedia di local storage
      print('Objek response tidak tersedia.');
    }

    var url = Uri.parse(
        'http://192.168.1.11/mahasiswa/kegiatan/kegiatan.php?mahasiswa_id=$mahasiswaId');
    var response = await http.get(url);
    var statusCode = response.statusCode;

    print("status code $statusCode");

    if (response.statusCode == 200) {
      Map<String, dynamic> responseData = jsonDecode(response.body);
      if (responseData["success"]) {
        setState(() {
          // products = List<Map<String, dynamic>>.from(responseData['data']);
          kegiatan = Map<String, dynamic>.from(responseData["data"]);
        });
      } else {
        final snackBar = SnackBar(
          content: const Text('Anda belum memiliki kegiatan'),
        );
        // 16. Kita tampilkan si snackbar
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    } else {
      print('Failed to fetch data. Status code: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    print(kegiatan);
    var tipeKegiatan = kegiatan["tipe_kegiatan"];
    return Scaffold(
      body: ListView(
        children: [
          
        ],
      ),
    );
  }
}
