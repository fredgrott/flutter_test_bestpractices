// This is an example unit test.
//
// A unit test tests a single function, method, or class. To learn more about
// writing unit tests, visit
// https://flutter.dev/docs/cookbook/testing/unit/introduction

import 'package:flutter_test/flutter_test.dart';

void main() {

  // setUpAll and tearDownAll for full test suite
  // then setUp and tearDown per group if needed

  // ignore: no-empty-block
  setUpAll(() async {});

  // ignore: no-empty-block
  tearDownAll(() async {});


  group('Plus Operator', () {
    test('should add two numbers together', () {
      expect(1 + 1, 2);
    });
  });
}
