import 'package:flutter/material.dart';
import 'package:final_project/components/playlist_card.dart';
import 'package:final_project/models/playlist_model.dart';
import 'package:final_project/theme/color_pallete.dart';
import '../../models/song_model.dart';
import 'package:google_fonts/google_fonts.dart';


class SongHomeScreen extends StatelessWidget {

  String currentExpression;

  SongHomeScreen({required this.currentExpression,Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    Playlist currentPlayList = Playlist.selectThePlayListAccordingToMood(currentExpression);
    
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.deepPurple.shade800.withOpacity(0.8),
            Colors.deepPurple.shade200.withOpacity(0.8),
          ],
        ),
      ),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const _DiscoverMusic(),
              _PlaylistMusic(playlist: currentPlayList),
            ],
          ),
        ),
      ),
    );
  }
}

class _PlaylistMusic extends StatelessWidget {
  const _PlaylistMusic({
    Key? key,
    required this.playlist,
  }) : super(key: key);

  final Playlist playlist;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [

          //playlist cards
          ListView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.only(top: 20),
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 1,
            itemBuilder: ((context, index) {
              return PlaylistCard(playlist: playlist);
            }),
          ),
        ],
      ),
    );
  }
}


//header details
class _DiscoverMusic extends StatelessWidget {
  const _DiscoverMusic({
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
                "Enjoy your favorite music",
                style: GoogleFonts.poppins(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: ColorSchema.white,

                )

            ),
          )

          ),


        ],
      ),
    );
  }
}


