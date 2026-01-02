import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:tcslearnapp/datastructures/get_song_data.dart';
import 'package:tcslearnapp/datastructures/songs.dart';
import 'package:tcslearnapp/programmingbasics/internet_connectivity_mixin.dart';
import 'package:tcslearnapp/programmingbasics/square_shape.dart';

class DataStructuresPracticeScreen extends StatelessWidget with InternetConnectivityMixin{

  List<Songs> _allSongsList = GetSongData().prepareSongsList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Data Structures Screen"),
        backgroundColor: Colors.deepOrange,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Inside data structures practice screen"),
            FilledButton(
                onPressed: (){
                  List<int> numbersList = [11,9,34,36,78,99,22,21,20,76];
                  List<int> updatedList = numbersList.where((int individualNumber) => individualNumber % 2 != 0 ).toList();
                  numbersList.where((int individualNumber) => individualNumber % 2 != 0 );
                  print("Updated list $updatedList");
                  print("Numbers list after operation $numbersList");
                },
                child: Text("Filter odd numbers")
            ),
            FilledButton(
                onPressed: (){
                  List<String> wordsList = [];
                  wordsList.add("Banti");
                  wordsList.add("Sunil");
                  wordsList.add("Sukumar");
                  wordsList.add("Rahul");
                  wordsList.add("Veena");
                  wordsList.add("Koushik");
                  wordsList.add("Besssy");
                  wordsList.add("");
                  List<String> filteredList = wordsList.where((String individualName) => individualName.length <= 5).toList();
                  print("Before filtering $wordsList");
                  wordsList = wordsList.where((String individualName) => individualName.isEmpty).map((element) => element = "-").toList();
                  print("After filtering $wordsList");
                  //var chainFilteredList = wordsList.where(( mappedEntry) => mappedEntry.isEmpty).toList();

                  print("Filtered list $filteredList");
                },
                child: Text("Filter Words")
            ),
            FilledButton(
                onPressed: (){
                  List<dynamic> mixedList = [];
                  mixedList.add(5);
                  mixedList.add(17.89);
                  mixedList.add("Dinash");
                  mixedList.add([1,3,4,5,6,7]);
                  mixedList.add(9);
                  print("Mixed list ${mixedList}");

                  var listItems = mixedList.where((element) => element is List).toList();
                  print("List items present in mixed list $listItems");

                  var integerItems = mixedList.where((element) => element is int).toList();
                  print("int items present in mixed list $integerItems");
                },
                child: Text("Mixed list example")
            ),
            FilledButton(
                onPressed: (){
                  Set<int> integerSet = {};
                  integerSet.add(55);
                  integerSet.add(77);
                  integerSet.add(99);
                  integerSet.add(109);
                  integerSet.add(99);
                  print("Integer set $integerSet");
                  Set<int> anotherIntegerSet = {};
                  anotherIntegerSet.add(155);
                  anotherIntegerSet.add(177);
                  anotherIntegerSet.add(199);
                  anotherIntegerSet.add(1109);
                  anotherIntegerSet.add(199);
                  anotherIntegerSet.add(99);

                  Set<int> union = integerSet.union(anotherIntegerSet);
                  Set<int> commonElements = integerSet.intersection(anotherIntegerSet);
                  print("Union set $union");
                  print("Intersection set $commonElements");
                },
                child: Text("Set example")
            ),
            FilledButton(
                onPressed: (){
                  SquareShape shapeObject = SquareShape();
                  shapeObject.area(12);
                  shapeObject.perimeterOfShape(4);
                  isInternetConnected = true;
                },
                child: Text("Understanding abstract")
            ),
            FilledButton(
                onPressed: (){
                  SplayTreeMap<int,String> numberMap = SplayTreeMap();
                  numberMap[1] = "Person A";
                  numberMap[2] = "Person B";
                  numberMap[5] = "Person D";
                  numberMap[3] = "Person C";
                  print(numberMap);
                },
                child: Text("Splay tree Map Example")
            ),
            FilledButton(
                onPressed: (){
                  List<Songs> updatedSongsList = _allSongsList.where((Songs individualSongs) => individualSongs.year > 2018).toList();
                  print(updatedSongsList);
                  _allSongsList.forEach((Songs currentSong){

                    print("Current song $currentSong");
                  });

                  List<Songs> sonuNigamSongsList = _allSongsList
                      .where((Songs individualSongs) => individualSongs.artist == "Sonu nigam" && individualSongs.genre == "Romantic").toList();
                  print("Sonu nigam songs list $sonuNigamSongsList");
                },
                child: Text("Filter Custom Model")
            ),
            FilledButton(
                onPressed: (){
                  List<String> songsStartingWithA = _allSongsList
                      .where((Songs individualSong) => individualSong.title.startsWith("A"))
                      .map((Songs currentSong) => currentSong.title.toUpperCase())
                      .toList();
                  print(songsStartingWithA);
                }, 
                child: Text("Chaining Operation in list ")
            ),
            FilledButton(
                onPressed: (){
                  int allSongsDuration = _allSongsList
                      .map((Songs currentSong) => currentSong.duration)
                    .toList()
                  .reduce((previousValue, currentSongDuration ) => previousValue + currentSongDuration);

                  print("All songs duration $allSongsDuration");
                },
                child: Text("Reduce Example")
            ),
            FilledButton(
                onPressed: (){
                  int concertPerformanceSongsDuration = _allSongsList
                      .where((Songs individualSong) => individualSong.album == "Concert Performance" && individualSong.year == 2018)
                      .map((Songs currentSong) => currentSong.duration)
                      .toList()
                      .reduce((previousValue, currentSongDuration) => previousValue + currentSongDuration);
                  print("Concert songs duration $concertPerformanceSongsDuration");
                },
                child: Text("Chain and reduce example ")
            ),
            FilledButton(
                onPressed: (){
                  int largestSongDuration = _allSongsList.map((Songs currentSong) => currentSong.duration)
                      .reduce((previousValue, nextValue){
                        if(previousValue > nextValue){
                          return previousValue;
                        }
                        else{
                          return nextValue;
                        }
                  });
                  print("Largest song duration $largestSongDuration");
                },
                child: Text("Find largest song duration")
            )
          ],
        ),
      ),
    );
  }

}