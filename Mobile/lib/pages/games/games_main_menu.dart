import 'package:flutter/material.dart';
import 'package:final_project/theme/color_pallete.dart';
import 'package:google_fonts/google_fonts.dart';


class GamesScreen extends StatelessWidget {
  const GamesScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          //heading
          Container(

              height: 150,
              decoration: BoxDecoration(
                  color: ColorSchema.darkGreen,
                  borderRadius: BorderRadius.only(bottomRight:Radius.circular(50),bottomLeft:Radius.circular(50) )
              )
              ,child:
          Center(
            child:  Text(
                "Enjoy your favorite games",
                style: GoogleFonts.poppins(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: ColorSchema.white,

                )

            ),
          )

          ),
          _tabComponent(context)

        ],
      ),
    );
  }
}

Widget _tabComponent(context){
 return Material(
      child:
      InkWell(
        onTap: () {

        },
        child: Container(
          height: 75,
          margin: const EdgeInsets.only(bottom: 10),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: Colors.green.shade800.withOpacity(0.6),
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15.0),

              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "test",
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                        color: ColorSchema.white,

                      ),
                    ),


                  ],
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.play_circle,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      )
  );
}