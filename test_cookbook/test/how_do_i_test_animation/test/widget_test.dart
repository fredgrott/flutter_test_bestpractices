// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.


import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:how_do_i_test_animation/main.dart';


void main() {
  testWidgets("How do I test an animation?", (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    final Finder startAnimationFinder = find.text("Start animation");
    final Finder animatedBoxFinder = find.byKey(const Key("animatedBox"));

    expect(startAnimationFinder, findsOneWidget);
    expect(animatedBoxFinder, findsOneWidget);

    // The box starts off with a height of 0
    final RenderConstrainedBox animatedBox = tester.renderObject(animatedBoxFinder);
    expect(animatedBox.size.height, 0);

    // Once we start the animation
    await tester.tap(startAnimationFinder);
    await tester.pump();

    // and wait 100 milliseconds
    await tester.pump(const Duration(milliseconds: 100));
    // we expect the height to grow from 0 to 10
    expect(animatedBox.size.height, 10);

    // after another 100 milliseconds it should grow to 20
    await tester.pump(const Duration(milliseconds: 100));
    expect(animatedBox.size.height, 20);

    await tester.pump(const Duration(milliseconds: 100));
    // and then 30
    expect(animatedBox.size.height, 30);

    await tester.pump(const Duration(milliseconds: 100));
    // and then 40
    expect(animatedBox.size.height, 40);

    await tester.pump(const Duration(milliseconds: 100));
    // and then 50
    expect(animatedBox.size.height, 50);

    await tester.pump(const Duration(milliseconds: 500));
    // and then after another 500 milliseconds, the animation should be
    // complete and be a total height of 100
    expect(animatedBox.size.height, 100);
  });
}
