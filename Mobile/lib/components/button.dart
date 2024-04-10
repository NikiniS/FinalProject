import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/color_pallete.dart';

class MyButton extends StatelessWidget {
  final Function()? onPressed;
  final String buttonText;
  Color buttonColor;

  MyButton(
      {super.key, required this.onPressed, required this.buttonText,this.buttonColor=ColorSchema.darkGreen});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        child: Container(
          padding: const EdgeInsets.fromLTRB(0, 14, 0, 10),
          height: 55,
          width: 275,
          decoration: BoxDecoration(
            color: ColorSchema.green,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Text(
            buttonText,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}