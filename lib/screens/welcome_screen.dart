import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import '../components/widgets.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    animation = ColorTween(begin: Colors.blueGrey, end: Colors.white)
        .animate(controller);
    controller.forward();
    controller.addListener(() {
      setState(() {});
      print(animation.value);
    });
  }

  @override
  void dispose() {
    controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Hero(
                  tag: 'logo',
                  child: Container(
                    height: 60.0,
                    // width: 80.0,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
                AnimatedTextKit(animatedTexts: [
                  TypewriterAnimatedText('Flash Chat',
                      textStyle: const TextStyle(
                        fontSize: 45.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w900,
                      ),
                      speed: const Duration(seconds: 1)),
                ])
                // Text(
                //   'Flash Chat',
                //   style: TextStyle(
                //     fontSize: 45.0,
                //     color: Colors.black,
                //     fontWeight: FontWeight.w900,
                //   ),
                // ),
              ],
            ),
            const SizedBox(
              height: 48.0,
            ),
            Buttons(
              text: 'Log In',
              color: Colors.lightBlueAccent,
              onpress: () {
                Navigator.pushNamed(context, LoginScreen.id);
              },
            ),
            Buttons(
              color: Colors.blueAccent,
              text: 'Register',
              onpress: () {
                Navigator.pushNamed(context, RegistrationScreen.id);
                //Go to registration screen.
              },
            )
          ],
        ),
      ),
    );
  }
}
