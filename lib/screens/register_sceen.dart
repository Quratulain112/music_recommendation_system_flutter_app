import 'package:flutter/material.dart';
import 'package:music_app/utils/api_service.dart';

class UserDetails {
  String username = "";
  String password = "";
  UserDetails({required this.username, required this.password});
}

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _firstnameController = TextEditingController();
  final _lastnameController = TextEditingController();
  final _usernameController = TextEditingController();
  final _password1Controller = TextEditingController();
  final _password2Controller = TextEditingController();
  final _emailController = TextEditingController();
  bool _ispasswordvisible1 = false;
  bool _ispasswordvisible2 = false;
  bool _isLoading = false;
  void _register() async {
    setState(() {
      _isLoading = true;
    });
    bool success = await ApiService.register(
      _usernameController.text,
      _password1Controller.text,
      _password2Controller.text,
      _emailController.text,
      _firstnameController.text,
      _lastnameController.text,
    );
    if (success) {
      UserDetails object = UserDetails(
          username: _usernameController.text,
          password: _password1Controller.text);
      Navigator.pushReplacementNamed(context, "/lg", arguments: object);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Faild to register"),
        ),
      );
    }
    setState(() {
      _isLoading = false;
    });
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
                  "Melody Flow",
                  style:
                      TextStyle(color: Colors.white, fontFamily: "Streetwear"),
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
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(right: 4.5),
                            child: TextFormField(
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                labelText: "First Name",
                              ),
                              controller: _firstnameController,
                            ),
                          ),
                        ),
                        Expanded(
                            child: Padding(
                          padding: EdgeInsets.only(left: 4.5),
                          child: TextFormField(
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              labelText: "Last Name",
                            ),
                            controller: _lastnameController,
                          ),
                        )),
                      ],
                    ),
                  ),
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
                      obscureText: !_ispasswordvisible1,
                      decoration: InputDecoration(
                          labelText: "Your Password",
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _ispasswordvisible1 = !_ispasswordvisible1;
                                });
                              },
                              icon: Icon(
                                _ispasswordvisible1
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ))),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(bottom: 35, top: 9, right: 9, left: 9),
                    child: TextFormField(
                      controller: _password2Controller,
                      style: TextStyle(color: Colors.white),
                      obscureText: !_ispasswordvisible2,
                      decoration: InputDecoration(
                          labelText: " Confirm Password",
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _ispasswordvisible2 = !_ispasswordvisible2;
                              });
                            },
                            icon: Icon(_ispasswordvisible2
                                ? Icons.visibility
                                : Icons.visibility_off),
                          )),
                    ),
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple),
                      onPressed: () {
                        _register();
                      },
                      child: (!_isLoading)
                          ? Text(
                              "Register",
                              style: TextStyle(color: Colors.white),
                            )
                          : SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            ))
                ],
              )),
        ));
  }
}
