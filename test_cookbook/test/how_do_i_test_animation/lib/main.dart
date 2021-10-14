// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.


import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Body(),
        ),
      ),
    );
  }
}

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    animation = Tween<double>(begin: 0, end: 100).animate(controller);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // ignore: deprecated_member_use
        RaisedButton(
          onPressed: () {
            controller.forward();
          },
          child: const Text("Start animation"),
        ),
        AnimatedBuilder(
          animation: animation,
          builder: (BuildContext _context, _child) {
            return Container(
              key: const Key("animatedBox"),
              height: animation.value,
              width: animation.value,
              decoration: BoxDecoration(
                border: Border.all(
                  // ignore: avoid_redundant_argument_values
                  color: Colors.black,
                  width: 2,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
