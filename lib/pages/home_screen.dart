import 'package:flutter/material.dart';
import 'package:yupo_daktari/pages/login_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: ElevatedButton(
            child: Text("Logout"),
            onPressed: () {
              //FirebaseAuth.instance.signOut().then((value) {
                Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));



            },
          ),
        )
    );
  }
}
