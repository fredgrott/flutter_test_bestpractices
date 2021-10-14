// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.


import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(children: [
          RaisedButton(
            child: Text("Throw Exception"),
            onPressed: () {
              throw Exception();
            },
          ),
          RaisedButton(
            child: Text("Throw MyCustomException"),
            onPressed: () {
              throw MyCustomException();
            },
          ),
        ]),
      ),
    );
  }
}

class MyCustomException implements Exception {
  MyCustomException();
}
