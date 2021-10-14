// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.


import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:how_do_i_send_keystroke/main.dart';


void main() {
  testWidgets("How do I send a keyboard event?", (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // First, let's confirm we have two TextFields on the page
    final Finder firstNameFinder = find.byType(TextField).at(0);
    final Finder lastNameFinder = find.byType(TextField).at(1);

    expect(firstNameFinder, findsOneWidget);
    expect(lastNameFinder, findsOneWidget);

    // Next, let's enter our first name
    await tester.showKeyboard(firstNameFinder);
    tester.testTextInput.enterText("John");

    // Tap the 'next' action in the keyboard
    await tester.testTextInput.receiveAction(TextInputAction.next);

    // This should automatically focus the last name
    // which means we don't need to show a new keyboard with a new finder
    tester.testTextInput.enterText("Doe");

    // Tap the 'done' action in the keyboard
    await tester.testTextInput.receiveAction(TextInputAction.done);

    // This should open a SnackBar with the entered name
    await tester.pumpAndSettle();
    expect(find.text("Your name is: John Doe"), findsOneWidget);
  });
}
