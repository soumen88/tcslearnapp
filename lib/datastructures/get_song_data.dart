import 'package:tcslearnapp/datastructures/songs.dart';

class GetSongData {

  List<Songs> prepareSongsList(){
    Songs songOne = Songs(
        duration: 4,
        id: "1",
        title: "ASong A",
        artist: "Atif aslam",
        album: "Concert Performance",
        genre: "Sufi",
        year: 2018,

    );

    Songs songTwo = Songs(
      id: "2",
      title: "Song B",
      artist: "Arijith Singh",
      album: "Movie",
      genre: "Sad",
      year: 2015,
      duration: 6,
    );

    Songs songThree = Songs(
      id: "3",
      title: "Song C",
      artist: "Sonu nigam",
      album: "Concert Performance",
      genre: "Romantic",
      year: 2018,
      duration: 5,
    );

    Songs songFour = Songs(
      id: "4",
      title: "Song D",
      artist: "Sonu nigam",
      album: "Concert Performance",
      genre: "General",
      year: 2019,
      duration: 2,
    );

    List<Songs> songsList = [];
    songsList.add(songOne);
    songsList.add(songTwo);
    songsList.add(songThree);
    songsList.add(songFour);
    return songsList;
  }
}