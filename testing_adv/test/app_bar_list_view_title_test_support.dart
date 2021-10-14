// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:given_when_then/given_when_then.dart';
import 'package:testing_adv/src/app.dart';
import 'package:testing_adv/src/infrastructure/app_test_vars.dart';

// The extensions are always named for the atomic name of the test to prevent 
// name clashes

Future<void> Function(WidgetTester) harness(
    // ignore: prefer-trailing-comma
    WidgetTestHarnessCallback<_WidgetTestHarness> callback) {
  return (tester) =>
      givenWhenThenWidgetTest(_WidgetTestHarness(tester), callback);
}

class _WidgetTestHarness extends WidgetTestHarness {
  _WidgetTestHarness(WidgetTester tester) : super(tester);
}

extension AppBarListViewGiven on WidgetTestGiven<_WidgetTestHarness> {
  Future<void> myAppExists() async {
    await settingsController.loadSettings();


    await tester.pumpWidget(MyApp(settingsController: settingsController,));
  }
}

extension AppBarListViewWhen on WidgetTestWhen<_WidgetTestHarness> {
  Future<void> appBarFound() async {
    await tester.pump();
    expect(find.byType(AppBar), findsOneWidget);
  }
}

extension AppBarListViewThen on WidgetTestThen<_WidgetTestHarness> {
  Future<void> appBarTitleIs() async {
    await tester.pump();
    expect(find.text(sampleItemListViewAppTitle), findsOneWidget);
  }
}


