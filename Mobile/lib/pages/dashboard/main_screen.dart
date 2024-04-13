import 'package:flutter/material.dart';
import '../../components/elements_grid.dart';
import '../../theme/color_pallete.dart';
import '../face_detection/camera_screen.dart';
import 'side_menu.dart';
import 'package:google_fonts/google_fonts.dart';


class MainScreen extends StatelessWidget {

  String username;
  static String currentMood="None";

   MainScreen({required this.username,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              color: Colors.grey,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications,
              color: Colors.grey,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 5, right: 16, bottom: 5),
            child: const CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://images.unsplash.com/photo-1500522144261-ea64433bbe27?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NTh8fHdvbWVufGVufDB8MHwwfHw%3D&auto=format&fit=crop&w=500&q=60"),
            ),
          )
        ],
      ),
      drawer: const SideMenu(),

      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              RichText(
                text:  TextSpan(
                  text: "Hello ",
                  style: TextStyle(color: ColorSchema.darkGreen, fontSize: 20),
                  children: [
                    TextSpan(
                      text:username,
                      style: TextStyle(
                          color: ColorSchema.darkGreen, fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: ", welcome back!",
                    ),
                  ],
                ),

              ),
              const SizedBox(
                height: 10,
              ),
              Text('you feel like ${CameraScreen.currentMood}',style:GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: ColorSchema.darkGreen,

              ) ,),
              const SizedBox(
                height: 15,
              ),
              Container(

                  height: 150,
                  decoration: BoxDecoration(
                      color: ColorSchema.darkGreen,
                      borderRadius: BorderRadius.only(bottomRight:Radius.circular(50),bottomLeft:Radius.circular(50) )
                  )
                  ,child:
                  Center(
                    child:  Text(
                        "Main Menu",
                        style: GoogleFonts.poppins(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color: ColorSchema.white,

                        )

                    ),
                  )

              ),

              const SizedBox(
                height: 10,
              ),
              const MenuElementGrid(),
              const SizedBox(
                height: 20,
              ),


            ],
          ),
        ),
      ),
    );
  }
}