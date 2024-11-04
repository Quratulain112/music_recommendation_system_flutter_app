import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage("assets/loginbag.jpg"),
      )),
      child: Padding(
          padding: EdgeInsets.only(
            top: 50,
            left: 20,
            right: 20,
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(9),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: "Your Name",
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(9),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: "Your Email",
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(9),
                child: TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Your Password",
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 35),
                child: TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: " Confirm Password",
                  ),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/lg");
                  },
                  child: Text("Register"))
            ],
          )),
    ));
  }
}
