import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      // TODO: ADD LOGO HERE
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover, image: AssetImage("assets/loginbag.jpg"))),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 150, left: 35, right: 35),
              child: TextField(
                decoration: InputDecoration(labelText: "Your Username"),
              ),
            ),
            const Padding(
              padding:
                  EdgeInsets.only(top: 12, left: 35, right: 35, bottom: 40),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(labelText: "Your Password"),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
              onPressed: () {
                Navigator.pushNamed(context, "/hm");
              },
              child: const Text(
                "Login",
                style: TextStyle(color: Colors.white),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
                onPressed: () {
                  Navigator.pushNamed(context, "/rg");
                },
                child: const Text(
                  "Register",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
