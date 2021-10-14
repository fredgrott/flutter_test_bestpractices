// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.


import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:how_do_i_test_an_exception/main.dart';



void main() {
  testWidgets("How do I test for an exception?", (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    // ignore: deprecated_member_use
    final Finder exceptionButtonFinder = find.byType(RaisedButton).at(0);
    // ignore: deprecated_member_use
    final Finder customExceptionButtonFinder = find.byType(RaisedButton).at(1);

    await tester.tap(exceptionButtonFinder);
    final Exception exception = tester.takeException() as Exception;
    expect(exception, isException);

    await tester.tap(customExceptionButtonFinder);
    final Exception customException = tester.takeException() as Exception;
    expect(customException, isInstanceOf<MyCustomException>());
  });
}
