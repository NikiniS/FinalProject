import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:final_project/theme/color_pallete.dart';

class MyTextField extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;
  final Icon prefixIcon;
  final Function()? onChanged;

  const MyTextField(
      {super.key,
        required this.controller,
        required this.hintText,
        required this.obscureText,
        required this.prefixIcon,
        this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      cursorColor: ColorSchema.darkGreen,
      decoration: InputDecoration(
        hintText: hintText,
        fillColor: ColorSchema.grey,
        contentPadding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
        hintStyle: GoogleFonts.poppins(
          fontSize: 15,
          color: ColorSchema.darkGreen,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
        prefixIcon: prefixIcon,
        prefixIconColor: ColorSchema.darkGreen,
        filled: true,
      ),
    );
  }
}