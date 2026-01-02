class Songs {
  final String id;
  final String title;
  final String artist;
  final String album;
  final String genre;
  final int year;
  final int duration;

  Songs({required this.id,required this.title,required this.artist,required this.album,required this.genre,required this.year,required this.duration});

  @override
  String toString() {
    return 'Songs{id: $id, title: $title, artist: $artist, album: $album, genre: $genre, year: $year, duration: $duration}';
  }


}