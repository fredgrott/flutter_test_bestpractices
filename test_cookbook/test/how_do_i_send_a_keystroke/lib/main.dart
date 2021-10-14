// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.


import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: MyForm(),
      ),
    );
  }
}

class MyForm extends StatefulWidget {
  const MyForm({Key? key}) : super(key: key);

  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  // We are creating controllers and focus nodes for our two text fields
  late TextEditingController firstNameController;
  late FocusNode firstNameFocusNode;

  late TextEditingController lastNameController;
  late FocusNode lastNameFocusNode;

  @override
  void initState() {
    super.initState();
    firstNameController = TextEditingController();
    firstNameFocusNode = FocusNode();

    lastNameController = TextEditingController();
    lastNameFocusNode = FocusNode();
  }

  // and we are cleaning up after ourselves by disposing the controllers and focus nodes
  @override
  void dispose() {
    firstNameController.dispose();
    firstNameFocusNode.dispose();

    lastNameController.dispose();
    lastNameFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextField(
          decoration: const InputDecoration(labelText: "First name"),
          textInputAction: TextInputAction.next,
          controller: firstNameController,
          focusNode: firstNameFocusNode,
          // When a user hits 'next' on the keyboard, it will unfocus firstName and focus lastName
          onSubmitted: (String _firstName) {
            firstNameFocusNode.unfocus();
            FocusScope.of(context).requestFocus(lastNameFocusNode);
          },
        ),
        TextField(
          decoration: const InputDecoration(labelText: "Last name"),
          textInputAction: TextInputAction.done,
          controller: lastNameController,
          focusNode: lastNameFocusNode,
          // When a user hits 'done' on the keyboard, it will unfocus lastName and then show a SnackBar with the full name
          onSubmitted: (String _lastName) {
            lastNameFocusNode.unfocus();
            // ignore: deprecated_member_use
            Scaffold.of(context).showSnackBar(SnackBar(
              content: Text(
                  "Your name is: ${firstNameController.text} ${lastNameController.text}",),
            ));
          },
        ),
      ],
    );
  }
}
