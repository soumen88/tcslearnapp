import 'package:tcslearnapp/programmingbasics/exercise.dart';
import 'package:tcslearnapp/programmingbasics/person.dart';

class Student extends Person with Exercise{
  //String studentName;
  //int studentAge;
  String academicName;

  Student({required super.personName, required super.age, required this.academicName});

  void printStudentDetails(){
    print(" Student name ${super.personName} and age ${super.age}");
    print("Academic name $academicName");
  }
}