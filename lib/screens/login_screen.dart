import 'package:flutter/material.dart';
import 'package:music_app/utils/api_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  void _login() async {
    bool success = await ApiService.login(
        _usernameController.text, _passwordController.text);
    if (!mounted) {
      return null;
    }
    if (success) {
      Navigator.pushReplacementNamed(context, "/hm");
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Faild to login"),
        ),
      );
    }
  }

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
            Padding(
              padding: EdgeInsets.only(top: 150, left: 35, right: 35),
              child: TextField(
                controller: _usernameController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(labelText: "Your Username"),
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(top: 12, left: 35, right: 35, bottom: 40),
              child: TextField(
                controller: _passwordController,
                style: TextStyle(color: Colors.white),
                obscureText: true,
                decoration: InputDecoration(labelText: "Your Password"),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
              onPressed: () {
                _login();
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
