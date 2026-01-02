import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tcslearnapp/lifecycle/counter_testing_screen.dart';

void main(){
  group('All test cases for floating buttons', (){
    testWidgets("Validate increment FAB", (WidgetTester tester) async{
      await tester.pumpWidget(MaterialApp(home: CounterTestingScreen(),));
      final appBar = find.byType(AppBar);
      expect(appBar, findsOneWidget);

      final counterText = find.text("Counter: 0");
      expect(counterText, findsOneWidget);

      ///Check for the tooltip which has "IncrementButton" on it
      final fabButtonIncrement = find.byTooltip("IncrementButton");
      expect(fabButtonIncrement, findsOneWidget);

      await tester.tap(fabButtonIncrement);
      await tester.pump();

      final updatedCounterText = find.text("Counter: 1");
      expect(updatedCounterText, findsOneWidget);
    });

    testWidgets("Validate restore FAB", (WidgetTester tester) async{
      await tester.pumpWidget(MaterialApp(home: CounterTestingScreen(),));
      final appBar = find.byType(AppBar);
      expect(appBar, findsOneWidget);

      final counterText = find.text("Counter: 0");
      expect(counterText, findsOneWidget);

      ///Check for the tooltip which has "IncrementButton" on it
      final fabButtonIncrement = find.byTooltip("IncrementButton");
      expect(fabButtonIncrement, findsOneWidget);

      await tester.tap(fabButtonIncrement);
      await tester.pump();
      final updatedCounterOneText = find.text("Counter: 1");
      expect(updatedCounterOneText, findsOneWidget);

      final fabButtonRestore = find.byTooltip("RestoreButton");
      expect(fabButtonRestore, findsOneWidget);

      await tester.tap(fabButtonRestore);
      await tester.pump();

      final updatedCounterText = find.text("Counter: 0");
      expect(updatedCounterText, findsOneWidget);

    });
  });

  group('All test cases for elevated buttons', (){
    testWidgets("Validate for Increment Elevated button", (WidgetTester tester) async{
      await tester.pumpWidget(MaterialApp(home: CounterTestingScreen(),));

      final incrementElevatedButton = find.byType(ElevatedButton).at(1);
      expect(incrementElevatedButton, findsOneWidget);

      await tester.tap(incrementElevatedButton);
      await tester.pump();

      final afterIncrementText = find.text("Counter: 2");
      expect(afterIncrementText, findsOneWidget);

    });

    testWidgets("Validate for increment by key", (WidgetTester tester) async{
      await tester.pumpWidget(MaterialApp(home: CounterTestingScreen(),));
      final incrementBy2Button = find.byKey(Key("Increment by 2 Key"));
      expect(incrementBy2Button, findsOneWidget);

      await tester.tap(incrementBy2Button);
      await tester.pump();

      final afterIncrementText = find.text("Counter: 2");
      expect(afterIncrementText, findsOneWidget);
    });
    
    testWidgets("Validate for decrement elevated button", (WidgetTester tester) async{
      await tester.pumpWidget(MaterialApp(home: CounterTestingScreen(),));
      final decrementElevatedButton = find.byType(ElevatedButton).last;
      expect(decrementElevatedButton, findsOneWidget);

      await tester.tap(decrementElevatedButton);
      await tester.pump();

      final afterDecrementText = find.text("Counter: -1");
      expect(afterDecrementText, findsOneWidget);
    } );
  });
}