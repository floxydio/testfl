import 'package:flutter/material.dart';

class MyButtonInput extends StatelessWidget {
  final Function onPress;
  final String text;
  const MyButtonInput({
    this.text,
    Key key, this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        child: ElevatedButton(onPressed: onPress, child: Text(text)));
  }
}
