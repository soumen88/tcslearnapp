class Person {
  String personName;
  int age;
  Person({required this.personName, required this.age});

  void displayDetails(){
    print("Person name $personName and his age $age");
  }
}