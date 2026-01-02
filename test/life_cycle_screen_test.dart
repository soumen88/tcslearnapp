import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tcslearnapp/lifecycle/life_cycle_screen.dart';

void main(){
  testWidgets("Testing whether the regular counter floating button increments", (WidgetTester tester) async{
      ///Step 1 - Show the life cycle screen in the tester
      await tester.pumpWidget(MaterialApp(home: LifeCycleScreen(),));
       /// Step 2 - Check if there exists a text as Regular 0
      final counterText = find.text("Regular 0");
      expect(counterText, findsOneWidget);
      /// Step 3 - Find the floating action button
      final incrementButton = find.byType(FloatingActionButton);
      expect(incrementButton, findsOneWidget);
      /// Step 4 - Tap on the button
      await tester.tap(incrementButton);
      ///Do a set state on the UI - Basically pump()
      await tester.pump();
      /// Step 5 - Because you have done a tap, now counter should be incremented by 1
      final updatedCounterText = find.text("Regular 1");
      expect(updatedCounterText, findsOneWidget);

      final initialSunilCounterText = find.text("Sunil 199");
      expect(initialSunilCounterText, findsOneWidget);
      final sunilButton = find.text("Change Sunil counter");
      expect(sunilButton, findsOneWidget);
      await tester.tap(sunilButton);
      await tester.pump();
      final updatedSunilCounterText = find.text("Sunil 198");
      expect(updatedSunilCounterText, findsOneWidget);
  });
}