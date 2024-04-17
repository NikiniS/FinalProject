class Song {

  final String title;
  final String description;
  final String url;
  final String coverUrl;

  Song({
    required this.title,
    required this.description,
    required this.url,
    required this.coverUrl,
  });

  static List<Song> calmSongs = [
    Song(
      title: 'calm 1',
      description: 'MÍA',
      url: "assets/music/calm/good-night-160166.mp3",
      coverUrl: "assets/images/22.jpg",
    ),
    Song(
      title: 'calm 2',
      description: 'Say My Name',
      url: "assets/music/calm/lovex27s-serenade-valentines-day-188266.mp3",
      coverUrl: "assets/images/22.jpg",
    ),
    Song(
      title: 'calm 3',
      description: 'Five More Hours',
      url: "assets/music/calm/once-in-paris-168895.mp3",
      coverUrl: "assets/images/22.jpg",
    )
  ];
  static List<Song> happySongs = [
    Song(
      title: 'happy 1',
      description: 'MÍA',
      url: "assets/music/happy/happy-holiday-120132.mp3",
      coverUrl: "assets/images/22.jpg",
    ),
    Song(
      title: 'happy 2',
      description: 'Say My Name',
      url: "assets/music/happy/David Guetta, Bebe Rexha & J Balvin - Say My Name.mp3",
      coverUrl:"assets/images/22.jpg",
    ),
    Song(
      title: 'happy 3',
      description: 'Five More Hours',
      url: "assets/music/happy/happy-summer-long-10627.mp3",
      coverUrl: "assets/images/22.jpg",
    ),


  ];
  static List<Song> exciteSongs = [
    Song(
      title: 'excite 1',
      description: 'MÍA',
      url: "assets/music/excite/BAD%20BUNNY%20x%20DRAKE%20-%20M%C3%8DA%20(Video%20Oficial).mp3",
      coverUrl: "assets/images/22.jpg",
    ),
    Song(
      title: 'excite 2',
      description: 'Say My Name',
      url: "assets/music/excite/David%20Guetta,%20Bebe%20Rexha%20&%20J%20Balvin%20-%20Say%20My%20Name.mp3",
      coverUrl: "assets/images/22.jpg",
    ),
    Song(
      title: 'excite 3',
      description: 'Five More Hours',
      url: "assets/music/excite/Deorro - Five More Hours ft. Chris Brown.mp3",
      coverUrl: "assets/images/22.jpg",
    )
  ];
}