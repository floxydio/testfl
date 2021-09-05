import 'package:flutter/material.dart';

import 'Component/MyButton_input.dart';
import 'Component/MyInput.dart';

import 'package:flutter/gestures.dart';
import './Login_Screen.dart';

class Register extends StatefulWidget {
  const Register({Key key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  GlobalKey<FormState> _form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Form(
        key: _form,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Register Account", style: TextStyle(fontSize: 24)),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 20,
            ),
            MyInput(
              password: false,
              text: "Email",
            ),
            SizedBox(
              height: 20,
            ),
            MyInput(
              password: false,
              text: "Name",
            ),
            SizedBox(
              height: 20,
            ),
            MyInput(
              password: true,
              text: "Password",
            ),
            SizedBox(
              height: 20,
            ),
            MyInput(
              password: true,
              text: "Re-type Password",
            ),
            SizedBox(
              height: 20,
            ),
            Text.rich(TextSpan(text: "Have Account ? ", children: [
              TextSpan(
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Login()));
                    },
                  text: "Sign In",
                  style: TextStyle(color: Colors.blueAccent))
            ])),
            SizedBox(height: 30),
            MyButtonInput(
              text: "Register",
              onPress: () {
                if (_form.currentState.validate()) {
                  print("Berhasil");
                }
              },
            )
          ],
        ),
      ),
    )));
  }
}
