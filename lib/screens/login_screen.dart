import 'package:flutter/material.dart';
import 'package:music_app/screens/register_sceen.dart';
import 'package:music_app/utils/api_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _ispasswordvisible = false;
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
    final UserDetails? userobject =
        ModalRoute.of(context)!.settings.arguments as UserDetails?;
    if (userobject != null) {
      _usernameController.text = userobject.username;
      _passwordController.text = userobject.password;
    }

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          title: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 15,
              children: [
                CircleAvatar(
                  radius: 26,
                  backgroundImage: AssetImage("assets/logo.jfif"),
                ),
                Text(
                  "MusicApp",
                  style: TextStyle(color: Colors.white),
                ),
              ])),
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
                obscureText: !_ispasswordvisible,
                decoration: InputDecoration(
                  labelText: "Your Password",
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _ispasswordvisible = !_ispasswordvisible;
                      });
                    },
                    icon: Icon(_ispasswordvisible
                        ? Icons.visibility
                        : Icons.visibility_off),
                  ),
                ),
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
