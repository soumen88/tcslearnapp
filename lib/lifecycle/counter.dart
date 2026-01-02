class Counter {
  int counter = 0;

  int increment(){
    counter++;
    return counter;
  }

  int decrement(){
    counter--;
    return counter;
  }

  int reset(){
    counter = 0;
    return counter;
  }

  int incrementBy2(){
    counter = counter + 2;
    return counter;
  }

  int decrementBy2(){
    counter = counter - 2;
    return counter;
  }
}