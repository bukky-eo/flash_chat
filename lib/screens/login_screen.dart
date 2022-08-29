import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/components/widgets.dart';
import 'package:flash_chat/constants.dart';
import 'package:flutter/material.dart';
// import 'package:modal_progress_hud/modal_progress_hud.dart';

import 'chat_screen.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool showSpinner = false;
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Hero(
                tag: 'logo',
                child: Container(
                  height: 200.0,
                  // width: 100.0,
                  child: Image.asset('images/logo.png'),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                  controller: _emailController,
                  onChanged: (value) {
                    //Do something with the user input.
                  },
                  decoration:
                      kInputDecoration.copyWith(hintText: 'Enter your email')),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                  controller: _passwordController,
                  onChanged: (value) {
                    //Do something with the user input.
                  },
                  decoration: kInputDecoration.copyWith(
                      hintText: 'Enter your password')),
              SizedBox(
                height: 24.0,
              ),
              Buttons(
                  text: 'Login',
                  color: Colors.lightBlueAccent,
                  onpress: () async {
                    // setState(() {
                    //   showSpinner = true;
                    // });

                    try {
                      final newUser = await auth.signInWithEmailAndPassword(
                          email: _emailController.text.trim(),
                          password: _passwordController.text.trim());
                      if (newUser != null) {
                        Navigator.pushNamed(context, ChatScreen.id);
                      }
                      // setState(() {
                      //   showSpinner = false;
                      // });
                    } catch (e) {
                      print(e);
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }
}
