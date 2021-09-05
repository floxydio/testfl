import 'package:flutter/material.dart';

class MyInput extends StatelessWidget {
  final String text;
  final bool password;
  final TextEditingController controller;
  const MyInput({
    Key key,
    this.text,
    this.password, this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        TextFormField(
          controller: controller ,
            validator: (value) {
              if (value.isEmpty) {
                return "Field is Required";
              } else {
                return null;
              }
            },
            obscureText: password,
            decoration:
                InputDecoration(border: OutlineInputBorder(), labelText: text)),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
