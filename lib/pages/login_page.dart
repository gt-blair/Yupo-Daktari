import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:yupo_daktari/pages/home_screen.dart';
import 'package:yupo_daktari/pages/signup_screen.dart';
import 'package:yupo_daktari/utils/services/auth_service.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


import '../utils/constants.dart';
import '../utils/helper_functions.dart';
import '../utils/services/database_service.dart';
import '../utils/widgets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();

  bool _isLoading = false;
  final formKey = GlobalKey<FormState>();
  AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading ? Center(
        child: CircularProgressIndicator(
          color: Constants().primaryG1,
        ),
      ) :
      Container(
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
            child: Form(
              key: formKey,
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
                  loginInSignUpButton(context, true, () async {
                    if(formKey.currentState!.validate()){
                      setState(() {
                        _isLoading = true;
                      });
                      await authService.loginWithEmailAndPassword(_emailTextController.text, _passwordTextController.text).then((value) async {
                        if (value == true){
                          QuerySnapshot snapshot = await DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid)
                              .gettingUserData(_emailTextController.text);

                          //saving value to shared preferences
                          await HelperFunction.saveUserLoggedInStatus(true);
                          await HelperFunction.saveUserEmailSF(_emailTextController.text);
                          await HelperFunction.saveUserNameSF(
                              snapshot.docs[0]["fullName"]
                          );

                          nextScreen(context, const HomePage());
                        }
                      });
                    }

                  }),
                  signUpOption()
                ],
              ),
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
