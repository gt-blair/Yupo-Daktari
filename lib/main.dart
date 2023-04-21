import 'package:flutter/material.dart';
import 'package:yupo_daktari/pages/home_screen.dart';
import 'package:yupo_daktari/pages/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:yupo_daktari/utils/constants.dart';
import 'package:yupo_daktari/utils/helper_functions.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if(kIsWeb){
    //web initialization
    await Firebase.initializeApp(options: FirebaseOptions(
        apiKey: Constants.apiKey,
        appId: Constants.appId,
        messagingSenderId: Constants.messagingSenderId,
        projectId: Constants.projectId));
  } else {
    //android initialization
    await Firebase.initializeApp();
  }


  runApp(const MyApp());
}


/*
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Yupo Daktari",
      home: WelcomeScreen(),
    );
  }
}
*/

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isSignedIn = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserLoggedInStatus();
  }

  getUserLoggedInStatus() async {
    await HelperFunction.getUserLoggedInStatus().then((value) {
      if (value != null) {
        setState(() {
          _isSignedIn = value;
        });
      }
    });
  }



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Yupo Daktari",
      home: _isSignedIn ? const HomePage() : WelcomeScreen(),
    );
  }
}


