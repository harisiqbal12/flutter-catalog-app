// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/routes.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String name = "";
  bool loading = false;

  final _formkey = GlobalKey<FormState>();

  loginPress(BuildContext context) async {
    print(_formkey.currentState!.validate());

    // final val = _formkey.currentState?.validate() ?? false;

    if (_formkey.currentState!.validate()) {
      setState(() {
        loading = true;
      });

      await Future.delayed(Duration(seconds: 1));

      // ignore: use_build_context_synchronously
      await Navigator.pushNamed(context, AppRoutes.homeRoute);
      setState(() {
        loading = false;
      });
    }
  }

  String? _validatePassword(String? value) {
    return value!.isEmpty ? "Password can't be empty" : null;
  }

  String? _validateEmail(String? value) {
    return value!.isEmpty ? "Email can't by empty" : null;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color(0xFFFFFFFF),
      child: Form(
        key: _formkey,
        child: Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            Image.asset(
              "assets/images/login-image-2.png",
              fit: BoxFit.cover,
              height: 300,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Welcome Back $name",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 32),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Type your email",
                        labelText: "Email",
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.deepPurple, width: 1.5),
                            borderRadius: BorderRadius.circular(5)),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black54, width: 1),
                            borderRadius: BorderRadius.circular(5)),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: _validateEmail,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Your Password",
                        labelText: "Password",
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.deepPurple, width: 1.5),
                            borderRadius: BorderRadius.circular(5)),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black54, width: 1),
                            borderRadius: BorderRadius.circular(5)),
                      ),
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      validator: _validatePassword,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: (() => loginPress(context)),
                      splashColor: Colors.purple.shade100,
                      child: AnimatedContainer(
                        width: 400,
                        height: 50,
                        duration: Duration(seconds: 1),
                        child: Ink(
                          decoration: BoxDecoration(
                            color: Colors.deepPurple,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                              child: loading
                                  ? SpinKitRing(
                                      color: Colors.white,
                                      size: 30,
                                      lineWidth: 3,
                                    )
                                  : Text(
                                      "Login",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}


// ElevatedButton(
//   onPressed: (() => _loginPress(context)),
//   style: TextButton.styleFrom(
//       padding: EdgeInsets.symmetric(
//           horizontal: 100.0, vertical: 20.0),
 //       minimumSize: Size(400, 50)),
//   child: Text("Login"),
  // )