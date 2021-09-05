import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:minggubsi/Home.dart';
import 'package:minggubsi/Register_screen.dart';

import 'Component/MyButton_input.dart';
import 'Component/MyInput.dart';
import 'package:dio/dio.dart';

class Login extends StatefulWidget {
  const Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  GlobalKey<FormState> _form = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  
  TextEditingController passwordController = TextEditingController();

  Future<dynamic> getTodo() async {
    try {
      var response =
          await Dio().get("https://jsonplaceholder.typicode.com/todos/");

      print("Response -> ${response.data}");
    } catch (e) {
      print("Error di -> $e");
    }
  }

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
            Text("Login Area", style: TextStyle(fontSize: 24)),
            SizedBox(
              height: 30,
            ),
            MyInput(
              password: false,
              text: "Email",
            ),
            MyInput(
              controller: emailController ,
              password: true,
              text: "Password",
            ),
            Text.rich(TextSpan(text: "Dont Have Account ? ", children: [
              TextSpan(
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Register()));
                    },
                  text: "Create Your Account",
                  style: TextStyle(color: Colors.blueAccent))
            ])),
            SizedBox(height: 30),
            MyButtonInput(
              text: "Login",
              onPress: () {
                if (_form.currentState.validate() && emailController == "dio@gmail.com" && passwordController == "1234") {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Home()));
                }
              },
            )
          ],
        ),
      ),
    )));
  }
}
