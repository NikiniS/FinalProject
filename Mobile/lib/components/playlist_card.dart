import 'package:flutter/material.dart';
import 'package:final_project/pages/musicplayer/playlist_screen.dart';
import 'package:final_project/theme/color_pallete.dart';
import '../models/playlist_model.dart';
import 'package:google_fonts/google_fonts.dart';

class PlaylistCard extends StatelessWidget {

  const PlaylistCard({
    Key? key,
    required this.playlist,
  }) : super(key: key);

  final Playlist playlist;

  @override
  Widget build(BuildContext context) {
    return
      Material(

    child:
      InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>

            PlaylistScreen(),

          ),
        );
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
              child: Image.network(
                playlist.imageUrl,
                height: 50,
                width: 50,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(width: 20),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    playlist.title,
                    style: GoogleFonts.poppins(

                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                      color: ColorSchema.white,

                    ),
                  ),
                  Text(
                    '${playlist.songs.length} songs',

                      maxLines: 2,
                      style: GoogleFonts.poppins(
                      fontSize: 10,
                      fontWeight: FontWeight.normal,
                      color: ColorSchema.white,

                    )
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
}