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
  List<Map<String, dynamic>> Data = [];

  
  Future<void> _getData() async {
    var url = Uri.parse('http://192.168.1.11/mahasiswa/users/allUsers.php');
    var respone = await http.get(url);

    if (respone.statusCode == 200){
      Map<String, dynamic> responseData = jsonDecode(respone.body);
      setState(() {
        Data = List<Map<String, dynamic>>.from(responseData['data']);
      });
    }else {
      print('Failed to fetch data. Status code: ${respone.statusCode}');
    }


  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: 
        const Text(
          'Daftar KKN & KKP',
              ),
        backgroundColor: orangeColor,
        ),
        body: ListView.builder(
          itemCount: Data.length,
          itemBuilder: (context, index) {
            var listData = Data[index];
            return Container(
              
        width: double.infinity,
        height: 220,
        margin: const EdgeInsets.only(
        top: 32,
      ),
        padding: const EdgeInsets.all(30),
        decoration: BoxDecoration(
         borderRadius: BorderRadius.circular(28),
          image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            'assets/img_bg_card.png',
          ),
        ),
      ),
      child: Column(
        // Membuat Text mulai darikiri terlebih dahulu
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Shayna Hanna',
            style: blackTextStyle.copyWith(
              fontSize: 18,
              fontWeight: medium,
            ),
          ),
          const SizedBox(
            height: 28,
          ),
          Text(
            '**** **** **** 1280',
            style: blackTextStyle.copyWith(
              fontSize: 18,
              fontWeight: medium,
              // membuat spasi
              letterSpacing: 4,
            ),
          ),
          const SizedBox(
            height: 21,
          ),
          Text(
            'Balance',
            style: blackTextStyle.copyWith(
              fontSize: 14,
            ),
          ),
          Text(
            'Rp. 12.500',
            style: blackTextStyle.copyWith(
              fontSize: 24,
            ),
          ),
        ],
      ),
            );
          }
          
          
          ),

    );
  }
}