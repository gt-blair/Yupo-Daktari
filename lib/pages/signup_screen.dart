import 'package:flutter/material.dart';
import 'package:yupo_daktari/pages/home_screen.dart';
import 'package:yupo_daktari/utils/constants.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController userNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(MediaQuery.of(context).size.height * 0.08),
        child: AppBar(
          centerTitle: true,
          backgroundColor: Constants().primaryG1,
          elevation: 10,
          title:  Text(
            "Sign Up",
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              color: Constants().secondaryColor
            ),
          ),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Constants().primaryG1,
              Constants().primaryG2,
              Constants().primaryG3,
            ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter
            )
        ),
        child: SingleChildScrollView(
            child:Padding(
              //padding: EdgeInsets.fromLTRB(20, 60, 20, 0),
              padding: EdgeInsets.fromLTRB(
                MediaQuery.of(context).size.width * 0.1,
                MediaQuery.of(context).size.height * 0.1,
                MediaQuery.of(context).size.width * 0.1,
                0
              ),
              child: Column(
                children: <Widget>[
                  logoWidget("assets/images/logo.png"),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(height:30,
                      child: loginSignupField("Enter UserName", Icons.person, false, userNameController)),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(height:30,
                      child: loginSignupField("Enter Email Id", Icons.person, false, emailController)),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(height:30,
                      child: loginSignupField("Enter Password", Icons.lock, true, passwordController)),
                  const SizedBox(
                    height: 20,
                  ),
                  loginInSignUpButton(context, false, () {

                      Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));

                  })
                ],
              ),
            )

        ),
      ),
    );
  }
}
