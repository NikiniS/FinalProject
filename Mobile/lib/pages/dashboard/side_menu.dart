import 'package:flutter/material.dart';
import 'package:final_project/pages/registration/login.dart';
import 'package:final_project/theme/color_pallete.dart';
import 'package:ternav_icons/ternav_icons.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    //drawer body
    return Drawer(
      backgroundColor: Colors.white,

      //drawer backgroundcolor
      surfaceTintColor: Colors.white,
      width: MediaQuery.of(context).size.width / 1.5,
      child: ListView(
        shrinkWrap: true,
        children: [

          //drawer heading
          SizedBox(
            height: 100,
            child: DrawerHeader(
                child: Image.asset(
                  "images/brand.png",
                ),
              decoration: BoxDecoration(
              color: Colors.white, // Match the drawer background color
            ),
            ),

          ),

          //drawer items
          DrawerListTile(
            icon: Icons.gamepad_outlined,
            title: "Play Games",
            onTap: () {},

          ),
          SizedBox(height: 30,),
          DrawerListTile(
            icon: TernavIcons.lightOutline.logout,
            title: "Logout",
            onTap: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const LoginBodyScreen()));
            },
          ),

        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    required this.icon,
    required this.title,
    required this.onTap,
  }) : super(key: key);
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      horizontalTitleGap: 0,
      leading: Icon(
        icon,
        color: ColorSchema.darkGreen,
        size: 18,
      ),
      title: Text(
        title,
        style: const TextStyle(color: ColorSchema.darkGreen),
      ),
    );
  }
}