// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.


import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:how_do_i_open_drawer/main.dart';



void main() {
  testWidgets('How do I open a Drawer?', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    final Finder drawerFinder = find.byType(Drawer);

    expect(drawerFinder, findsNothing);

    //
    // Method a)
    //

    // open Drawer by tapping the menu icon in the Appbar
    final Finder menuIconFinder = find.byIcon(Icons.menu);
    await tester.tap(menuIconFinder);
    await tester.pumpAndSettle();

    // confirm that the Drawer is open
    expect(drawerFinder, findsOneWidget);

    // close Drawer
    Navigator.of(tester.element(drawerFinder)).pop();
    await tester.pumpAndSettle();
    expect(drawerFinder, findsNothing);

    //
    // Method b)
    //

    // open Drawer by using scaffoldKey
    scaffoldKey.currentState!.openDrawer();
    await tester.pumpAndSettle();

    // confirm that the Drawer is open
    expect(drawerFinder, findsOneWidget);

    // close Drawer
    Navigator.of(tester.element(drawerFinder)).pop();
    await tester.pumpAndSettle();
    expect(drawerFinder, findsNothing);

    //
    // Method c)
    //

    // open Drawer by using a BuildContext and finding a Scaffold with Scaffold.of
    final Finder bodyFinder = find.byType(Body);
    Scaffold.of(tester.element(bodyFinder)).openDrawer();
    await tester.pumpAndSettle();

    // confirm that the Drawer is open
    expect(drawerFinder, findsOneWidget);

    // close Drawer
    Navigator.of(tester.element(drawerFinder)).pop();
    await tester.pumpAndSettle();
    expect(drawerFinder, findsNothing);

    //
    // Method d)
    //

    // open Drawer by swiping from the left edge
    await tester.dragFrom(const Offset(0, 100), const Offset(300, 100));
    await tester.pumpAndSettle();

    // confirm that the Drawer is open
    expect(drawerFinder, findsOneWidget);

    // close Drawer
    Navigator.of(tester.element(drawerFinder)).pop();
    await tester.pumpAndSettle();
    expect(drawerFinder, findsNothing);
  });
}
