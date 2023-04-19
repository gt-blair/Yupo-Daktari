import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:yupo_daktari/pages/home_screen.dart';
import 'package:yupo_daktari/pages/signup_screen.dart';

import '../utils/constants.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Constants().primaryG1,
              Constants().primaryG2,
              Constants().primaryG3,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                20, MediaQuery.of(context).size.height * 0.1, 20, 0),
            child: Column(
              children: <Widget>[
                logoWidget("assets/images/logo.png"),
                SizedBox(
                  height: 30,
                ),
                SizedBox(height:30,
                    child: loginSignupField("Enter UserName", Icons.person, false, _emailTextController)),
                SizedBox(
                  height: 20,
                ),
                SizedBox(height:30,
                    child: loginSignupField("Enter Password", Icons.lock, true, _passwordTextController)),
                SizedBox(
                  height: 20,
                ),
                loginInSignUpButton(context, true, () {
                    //Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));

                }),
                signUpOption()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
         Text("Don't have an account?",
          style: TextStyle(color: Constants().accentColor),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage()));
          },
          child: Text("Sign Up",
            style: TextStyle(color: Constants().primaryG2,
                fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }

}
