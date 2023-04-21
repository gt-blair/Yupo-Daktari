import 'package:flutter/material.dart';
import 'package:yupo_daktari/pages/home_screen.dart';
import 'package:yupo_daktari/pages/login_page.dart';
import 'package:yupo_daktari/utils/constants.dart';
import 'package:yupo_daktari/utils/services/auth_service.dart';

import '../utils/helper_functions.dart';
import '../utils/widgets.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController speacilityController = TextEditingController();

  bool _isLoading = false;
  final formKey = GlobalKey<FormState>();
  AuthService authService = AuthService();

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
              child: Form(
                key: formKey,
                child: Column(
                  children: <Widget>[
                    logoWidget("assets/images/logo.png"),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(height:30,
                        child: loginSignupField("Enter FullName", Icons.person, false, fullNameController)),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(height:30,
                        child: loginSignupField("Enter Email Id", Icons.email, false, emailController)),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(height:30,
                        child: loginSignupField("Enter Phone Number", Icons.phone, false, phoneNumberController)),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(height:30,
                        child: loginSignupField("Speciality", Icons.work, false, speacilityController)),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(height:30,
                        child: loginSignupField("Enter Password", Icons.lock, true, passwordController)),
                    const SizedBox(
                      height: 10,
                    ),
                    loginInSignUpButton(context, false, () async {
                      if (formKey.currentState!.validate()){
                        setState(() {
                          _isLoading = true;
                        });
                        await authService.registerUserWithEmailandPassword(
                            fullNameController.text,
                            emailController.text,
                            passwordController.text,
                            speacilityController.text,
                            passwordController.text).then((value) async {
                          if(value == true){
                            //saving shared preferences
                            await HelperFunction.saveUserLoggedInStatus(true);
                            await HelperFunction.saveUserEmailSF(emailController.text);
                            await HelperFunction.saveUserNameSF(fullNameController.text);
                            nextScreenReplacement(context, const HomePage());
                          } else {
                            showSnackBar(context, Colors.red, value);
                            setState(() {
                              _isLoading = false;
                            });
                          }
                        });
                      }

                        //Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));

                    }),
                    loginOption(),
                    const SizedBox(
                      height:10,
                    ),
                  ],
                ),
              ),
            )

        ),
      ),
    );
  }

  Row loginOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Have an Account?",
          style: TextStyle(
              color: Constants().accentColor
              //fontW
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
          },
          child: Text("Log In",
            style: TextStyle(color: Constants().primaryG2,
                fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }

}
