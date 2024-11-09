import 'package:flutter/material.dart';
import 'package:music_app/utils/api_service.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _usernameController = TextEditingController();
  final _password1Controller = TextEditingController();
  final _password2Controller = TextEditingController();
  final _emailController = TextEditingController();
  void _register() async {
    bool success = await ApiService.register(_usernameController.text,
        _password1Controller.text, _password2Controller.text);
    if (success) {
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Faild to register"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
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
              ]),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              )),
        ),
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("assets/loginbag.jpg"),
          )),
          child: Padding(
              padding: EdgeInsets.only(
                top: 100,
                left: 20,
                right: 20,
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(9),
                    child: TextFormField(
                      controller: _usernameController,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        labelText: "Your UserName",
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(9),
                    child: TextFormField(
                      controller: _emailController,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        labelText: "Your Email",
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(9),
                    child: TextFormField(
                      controller: _password1Controller,
                      style: TextStyle(color: Colors.white),
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: "Your Password",
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 35),
                    child: TextFormField(
                      controller: _password2Controller,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: " Confirm Password",
                      ),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        _register();
                      },
                      child: Text("Register"))
                ],
              )),
        ));
  }
}
