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
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/loginbag.jpg"))),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 150, left: 35, right: 35),
              child: TextField(
                decoration: InputDecoration(labelText: "Your Username"),
              ),
            ),
            Padding(
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
              child: Text(
                "Login",
                style: TextStyle(color: Colors.white),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
                onPressed: () {
                  Navigator.pushNamed(context, "/rg");
                },
                child: Text(
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
