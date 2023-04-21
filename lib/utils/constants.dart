import 'package:flutter/material.dart';

class Constants{
  final secondaryColor = hexStringToColor("FFFFFF");
  final accentColor = hexStringToColor("000000");
  
  final primaryG1 = hexStringToColor("15006D");
  final primaryG2 = hexStringToColor("03254B");
  final primaryG3 = hexStringToColor("D8E9F7");

  static String appId = "1:1031503962590:web:96494ecba4eea7f6cc7d4f";
  static String apiKey = "AIzaSyDNRwFHVa6qLHjZAz6jSTGp4QnTMBpSJhA";
  static String messagingSenderId = "1031503962590";
  static String projectId = "yupo-daktari";


}

hexStringToColor(String hexColor) {
  hexColor = hexColor.toUpperCase().replaceAll("#", "");
  if (hexColor.length == 6) {
    hexColor = "FF" + hexColor;
  }
  return Color(int.parse(hexColor, radix: 16));
}

Image logoWidget(String imageName){
  return Image.asset(
    imageName,
    fit: BoxFit.fitWidth,
    width: 240,
    height: 240,
    color: Colors.white,
  );
}

TextField loginSignupField(String text, IconData icon, bool isPasswordType, TextEditingController controller){
  return TextField(
    controller: controller,
    obscureText: isPasswordType,
    enableSuggestions: !isPasswordType,
    autocorrect: !isPasswordType,
    cursorColor: Constants().secondaryColor,
    style: TextStyle(
      color: Constants().accentColor.withOpacity(0.9),
      fontSize: 15,
    ),
    decoration: InputDecoration(
      //contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 15),
      prefix: Icon(
        icon,
        color: Constants().accentColor,
        size: 15,
      ),
      labelText: text,
      labelStyle: TextStyle(
        color: Constants().secondaryColor.withOpacity(0.5),
      ),
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      fillColor: Constants().primaryG2.withOpacity(0.3),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(
          width: 0,
          style: BorderStyle.none
        )
      )

    ),
  );
}


Container loginInSignUpButton( BuildContext context, bool isLogin, Function onTap) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 30,
    margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
    child: ElevatedButton(
      onPressed: () {
        onTap();
      },
      child: Text(
        isLogin ? "LOG IN" : "SIGN UP",
        style:  TextStyle(
            color: Constants().secondaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 16
        ),
      ),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return Colors.black26;
            }
            return Constants().primaryG1;
          }),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))
          )
      ),
    ),
  );
}
