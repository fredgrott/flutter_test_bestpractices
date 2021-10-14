// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.


import 'package:flutter_test/flutter_test.dart';
import 'package:how_do_i_drag/main.dart';


void main() {
  testWidgets("How do I drag something?", (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    final Finder draggableFinder = find.text("Draggable");
    final Finder dragTargetFinder = find.text("Drag Target");

    expect(draggableFinder, findsOneWidget);
    expect(dragTargetFinder, findsOneWidget);

    await tester.drag(draggableFinder, const Offset(0, 100));
    await tester.pump();

    expect(dragTargetFinder, findsNothing);

    final Finder successfulDragFinder = find.text("Successful drag!");
    expect(successfulDragFinder, findsOneWidget);
  });
}

