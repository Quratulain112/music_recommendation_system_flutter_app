import 'package:flutter/material.dart';
import 'package:music_app/utils/api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  Future<void> gotoNextScreen() async {
    bool check = await ApiService.isLoggedIn();
    if (!mounted) {
      return;
    }
    if (check) {
      Navigator.pushReplacementNamed(context, "/hm");
    } else {
      Navigator.pushReplacementNamed(context, "/lg");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: 500,
      decoration: BoxDecoration(
          gradient: LinearGradient(transform: GradientRotation(1), colors: [
        const Color.fromARGB(255, 65, 4, 140),
        const Color.fromARGB(255, 36, 1, 42),
      ])),
      child: Padding(
        padding: EdgeInsets.only(top: 70, left: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Image(
                height: 250, image: AssetImage('assets/headphones.png')),
            Text(
              "enjoy your \nmusic, enjoy \nyour life",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white),
            ),
            Text(
              "listen to your music for \nfree,anywhere.",
              style: TextStyle(color: const Color.fromARGB(255, 205, 198, 198)),
            ),
            Padding(
              padding: EdgeInsets.only(top: 50),
              child: ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.purple),
                  onPressed: () {
                    gotoNextScreen();
                  },
                  child: Wrap(
                    spacing: 10,
                    children: [
                      Text(
                        "Get Started",
                        style: TextStyle(color: Colors.white),
                      ),
                      Icon(
                        Icons.arrow_circle_right,
                        color: Colors.white,
                      )
                    ],
                  )),
            )
          ],
        ),
      ),
    ));
  }
}
