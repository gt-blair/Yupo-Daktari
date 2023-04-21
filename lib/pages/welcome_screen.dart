import 'package:flutter/material.dart';
import 'package:yupo_daktari/pages/home_screen.dart';
import 'package:yupo_daktari/pages/login_page.dart';
import 'package:yupo_daktari/utils/constants.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
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
          )
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20,
                MediaQuery.of(context).size.height * 0.1,
                20, 0),
            child: Column(
              children: <Widget>[
                logoWidget("assets/images/logo.png"),
                Text(
                  "Yupo Daktari",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,

                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02,),
                Text(
                  "Find Doctors Across all fields... Anywhere",
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.italic,

                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.1,),
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return const HomePage();
                      }
                    ));
                  },
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      color: Constants().primaryG1,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child:  Center(
                      child:  Text(
                        "Get Started",
                        style: TextStyle(
                          color: Constants().secondaryColor,
                          fontWeight: FontWeight.bold,

                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.05,),
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return const LoginPage();
                        }
                    ));
                  },
                  child: Container(
                    height: 20,

                    child:  Center(
                      child:  Text(
                        "Sign Up / Login as a Doctor",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Constants().primaryG1,
                          fontWeight: FontWeight.bold,

                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
