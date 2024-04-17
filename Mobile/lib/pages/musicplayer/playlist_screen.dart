import 'package:flutter/material.dart';
import 'package:final_project/models/playlist_model.dart';
import 'package:final_project/pages/face_detection/camera_screen.dart';
import 'package:final_project/pages/musicplayer/home_screen.dart';
import 'package:final_project/pages/musicplayer/song_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:final_project/theme/color_pallete.dart';

class PlaylistScreen extends StatelessWidget {

  const PlaylistScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Playlist playlist = Playlist.selectThePlayListAccordingToMood(CameraScreen.currentMood);

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.green.shade800.withOpacity(0.8),
            Colors.green.shade200.withOpacity(0.8),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title:  Text('Playlist',style:GoogleFonts.poppins(
            fontSize: 30,
            fontWeight: FontWeight.normal,
            color: ColorSchema.white,
          )),
        ),

        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                _PlaylistInformation(playlist: playlist),
                const SizedBox(height: 30),
                const _PlayOrShuffleSwitch(),
                _PlaylistSongs(playlist: playlist),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _PlaylistSongs extends StatelessWidget {
  const _PlaylistSongs({
    Key? key,
    required this.playlist,
  }) : super(key: key);

  final Playlist playlist;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: playlist.songs.length,
      itemBuilder: (context, index) {

        //song items

        //song index
        return ListTile(
          leading: Text(
            '${index + 1}',
            style: GoogleFonts.poppins(
              fontSize: 30,
              fontWeight: FontWeight.normal,
              color: Colors.green.shade800,

            )
          ),
          title: Text(
            playlist.songs[index].title,
            style:GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.normal,
              color: Colors.green.shade900,

            )
          ),
          subtitle: Text('${playlist.songs[index].description}',style:
          GoogleFonts.poppins(
            fontSize: 10,
            fontWeight: FontWeight.normal,
            color: Colors.white,

          )
          ),
          trailing: const Icon(
            Icons.more_vert,
            color: Colors.white,
          ),
          onTap: (){
            Navigator.push(
                context,
                MaterialPageRoute(
                builder: (context) =>
                    SongScreen(currentSong: playlist.songs[index]),
            )
            );
          },
        );
      },
    );
  }
}

class _PlayOrShuffleSwitch extends StatefulWidget {

  const _PlayOrShuffleSwitch({
    Key? key,
  }) : super(key: key);

  @override
  State<_PlayOrShuffleSwitch> createState() => _PlayOrShuffleSwitchState();

}

class _PlayOrShuffleSwitchState extends State<_PlayOrShuffleSwitch> {
  bool isPlay = true;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        setState(() {
          isPlay = !isPlay;
        });
      },
      child: Container(
        height: 50,
        width: width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: const Duration(milliseconds: 200),
              left: isPlay ? 0 : width * 0.45,
              child: Container(
                height: 50,
                width: width * 0.45,
                decoration: BoxDecoration(
                  color: Colors.green.shade800,
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Text(
                          'Play',
                          style: TextStyle(
                            color: isPlay ? Colors.white : Colors.green.shade800,
                            fontSize: 17,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Icon(
                        Icons.play_circle,
                        color: isPlay ? Colors.white : Colors.green.shade800,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Text(
                          'Shuffle',
                          style: TextStyle(
                            color: isPlay ? Colors.green.shade800 : Colors.white,
                            fontSize: 17,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Icon(
                        Icons.shuffle,
                        color: isPlay ? Colors.green.shade800 : Colors.white,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _PlaylistInformation extends StatelessWidget {
  const _PlaylistInformation({
    Key? key,
    required this.playlist,
  }) : super(key: key);

  final Playlist playlist;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15.0),
          child: Image.network(
            playlist.imageUrl,
            height: MediaQuery.of(context).size.height * 0.3,
            width: MediaQuery.of(context).size.height * 0.3,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 30),
        Text(
          playlist.title,
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .copyWith(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}