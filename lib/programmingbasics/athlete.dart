import 'package:tcslearnapp/programmingbasics/exercise.dart';
import 'package:tcslearnapp/programmingbasics/person.dart';

class Athlete extends Person with Exercise{
  //String studentName;
  //int studentAge;
  String sportName;

  Athlete({required super.personName, required super.age, required this.sportName});

  void printAthleteDetails(){
    print(" Student name ${super.personName} and age ${super.age}");
    print("Sport name $sportName");
  }
}