import 'package:flutter/material.dart';
import 'package:project_3/shared/theme.dart';

// button yang sudah ada isinya Warna
class CustomFilledButton extends StatelessWidget {
  // Membuat state untuk mengubah isi si button
  // Ini string untuk si tittle karena bentuknya string
  final String tittle;
  // Utnu tintggi button karena bnetuknya angka
  final double height;
  // Untuk lebar si button
  final double width;
  // Untuk halaman ini mau di rahkan kemana
  final VoidCallback? onPressed;

  const CustomFilledButton({
    Key? key,
    // Reuired artinya wajib untuk di isi
    required this.tittle,
    // Untuk Kondisi lebar si button slebar dengan container
    this.width = double.infinity,
    // Untuk tinggi si button
    this.height = 50,
    // Untuk link dari si button mau di arahkan kemana
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // Agar selebar dengan container
      width: width,
      height: height,
      child: TextButton(
        // Membuat Text button
        style: TextButton.styleFrom(
          backgroundColor: orangeColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(56),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          tittle,
          style: whiteTextStyle.copyWith(
            fontSize: 16,
            fontWeight: semibold,
          ),
        ),
      ),
    );
  }
}
