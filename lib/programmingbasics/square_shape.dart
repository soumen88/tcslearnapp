import 'package:tcslearnapp/programmingbasics/shapes.dart';

class SquareShape implements Shapes{

  String shapeName = "Square Shape";

  @override
  void area(int input) {
    int areaOfSquare = input * input;
    print("Area of square $areaOfSquare");
  }

  @override
  void perimeterOfShape(int side) {
    int perimeterOfSquare = side * 4;
    print("Perimeter of square $perimeterOfSquare");
  }

}