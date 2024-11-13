import 'package:flutter/material.dart';
import 'package:music_app/utils/api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  bool _isLoading = false;

  Future<void> gotoNextScreen() async {
    setState(() {
      _isLoading = true;
    });
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
    var size = MediaQuery.of(context).size;

    final double screenHeight = (size.height - kToolbarHeight - 24);
    final double screenWidth = size.width;

    return Scaffold(
        body: Container(
      width: screenWidth,
      decoration: BoxDecoration(
          gradient: LinearGradient(transform: GradientRotation(1), colors: [
        const Color.fromARGB(255, 65, 4, 140),
        const Color.fromARGB(255, 36, 1, 42),
      ])),
      child: Padding(
        padding:
            EdgeInsets.only(top: screenHeight * 0.10, left: screenWidth * 0.15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(
                height: screenHeight * 0.45,
                image: AssetImage('assets/headphones.png')),
            Text(
              "enjoy your \nmusic, enjoy \nyour life",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: screenHeight * 0.04,
                  color: Colors.white),
            ),
            Text(
              "listen to your music for \nfree,anywhere.",
              style: TextStyle(
                  color: const Color.fromARGB(255, 205, 198, 198),
                  fontSize: screenHeight * 0.025),
            ),
            Padding(
              padding: EdgeInsets.only(top: screenHeight * 0.06),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  minimumSize: Size(screenWidth * 0.02, screenHeight * 0.07),
                ),
                onPressed: () {
                  gotoNextScreen();
                },
                child: (!_isLoading)
                    ? Wrap(
                        spacing: 10,
                        children: [
                          Text(
                            "Get Started",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: screenHeight * 0.027),
                          ),
                          Icon(
                            Icons.arrow_circle_right,
                            color: Colors.white,
                            size: screenHeight * 0.04,
                          )
                        ],
                      )
                    : CircularProgressIndicator(),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
