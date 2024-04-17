import 'song_model.dart';

class Playlist {
  final String title;
  final List<Song> songs;
  final String imageUrl;

  Playlist({
    required this.title,
    required this.songs,
    required this.imageUrl,
  });

  //select the matched playList according to the current mood
  static Playlist selectThePlayListAccordingToMood(String expression){

    if(expression=='Sad' || expression=='Happy'){
      return Playlist.playlists[1];
    }
    else if(expression=='Fear' || expression=='Angry'){
      return  Playlist.playlists[0];
    }
    else if(expression=='Surprise'){
      return Playlist.playlists[2];
    }
    else{
      return Playlist.playlists[1];
    }

  }

  static List<Playlist> playlists = [
    Playlist(
      title: 'CALM',
      songs: Song.calmSongs,
      imageUrl:
      'https://images.unsplash.com/photo-1576525865260-9f0e7cfb02b3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1364&q=80',
    ),
    Playlist(
      title: 'HAPPY',
      songs: Song.happySongs,
      imageUrl:
      'https://images.unsplash.com/photo-1629276301820-0f3eedc29fd0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2848&q=80',
    ),
    Playlist(
      title: 'EXCITE',
      songs: Song.exciteSongs,
      imageUrl:
      'https://images.unsplash.com/photo-1594623930572-300a3011d9ae?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2670&q=80',
    ),

  ];
}