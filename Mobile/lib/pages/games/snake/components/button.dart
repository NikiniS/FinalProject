import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyButton extends StatelessWidget {
  final Function()? onPressed;
  final String buttonText;
  Color buttonColor;
  Color textColor;
  double fontSize;
  double buttonWidth;
  double buttonHeight;


  MyButton(
      {super.key, required this.onPressed, required this.buttonText,
        this.buttonColor=Colors.grey,this.textColor=Colors.white,
        this.fontSize=18,this.buttonWidth=275,this.buttonHeight=55
      });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        child: Container(
          padding: const EdgeInsets.fromLTRB(0, 14, 0, 10),
          height: buttonHeight,
          width: buttonWidth,
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(30),

          ),
          child: Text(
            buttonText,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: this.fontSize,
              fontWeight: FontWeight.w600,
            ),


          ),
        ),
      ),
    );
  }
}