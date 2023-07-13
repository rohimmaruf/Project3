import 'package:flutter/material.dart';
import 'package:project_3/shared/theme.dart';

class FormDate extends StatelessWidget {
  // Variable untuk tittle
  final String title;
  // Untuk Tulisan seperti password
  final bool obscureText;
  // Untuk arah si value kolom
  final TextEditingController? controller;

  const FormDate({
    super.key,
    required this.title,
    this.obscureText = false,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      // Utnuk memulai posisi Text
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: blackTextStyle.copyWith(
            fontSize: 14,
            fontWeight: medium,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        // Untuk membuat Form atau form label
        TextFormField(
          // Untuk jadi Bintang bintang atau

          obscureText: obscureText,
          controller: controller,

          decoration: InputDecoration(
            // Untuk menambah garis pada Field
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            // Untuk mengatur padding seluruhnya isi content
            contentPadding: const EdgeInsets.all(12),
          ),
        ),
      ],
    );
  }
}
