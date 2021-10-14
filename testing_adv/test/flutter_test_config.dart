// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'dart:async';

import 'package:flutter_test/flutter_test.dart';

// For Flutter Test package we can set up a config file
// to enable all tests to be executed automatically.
Future<void> testExecutable(FutureOr<void> Function() testMain) async {
  // ignore: no-empty-block
  setUpAll(() async {
    
  });
  
  return testMain();
}
