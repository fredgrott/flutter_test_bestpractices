// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.


import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:how_do_i_find/main.dart';



void main() {
  testWidgets('how do i find something?', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    // Let's find a widget by its type
    // ignore: deprecated_member_use
    final Finder raisedButtonFinder = find.byType(RaisedButton);
    expect(raisedButtonFinder, findsOneWidget);

    // Let's find a specific string of text
    final Finder textFinder = find.text("we will find this by searching for text");
    expect(textFinder, findsOneWidget);

    // Let's find a widget by its key
    final Finder keyFinder = find.byKey(const Key("mykey"));
    expect(keyFinder, findsOneWidget);
  });
}
