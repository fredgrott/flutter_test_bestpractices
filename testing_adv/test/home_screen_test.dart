// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter_test/flutter_test.dart';
import 'package:testing_adv/src/infrastructure/app_test_vars.dart';

import 'app_bar_list_view_title_test_support.dart';

// In Acceptance and BDD testing our testing
// atomic unit is a scenario test suite. We know we are implementing it
// right if most of the thing reads like an English sentence as
// two groups read this, the devs and the other stakeholders when
// they see test report results.
//
// Or in short words, once the api devs write the test fixtures and harness parts,
// the test qa should be able to plug and chug those parts together in
// scenario test suites like this one.
//
// Best part is that when Integrated Testing is in stable channel this
// same technique can be used with integrated testing as well.

void main() {
  setUpAll(() async {
    // required for all unit testing to ensure the Flutter Engine is fully
    // initialized before tests are fully run
    TestWidgetsFlutterBinding.ensureInitialized();
  });

  // ignore: no-empty-block
  tearDownAll(() async {});

  group('appbar test', () {
    testWidgets('AppBar Title is $sampleItemListViewAppTitle',
        harness((given, when, then) async {
      await given.myAppExists();
      await when.appBarFound();
      await then.appBarTitleIs();
    }),);
  });
}
