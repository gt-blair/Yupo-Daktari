import 'package:yupo_daktari/utils/helper_functions.dart';
import 'package:yupo_daktari/utils/services/database_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService{
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  //login function
  Future loginWithEmailAndPassword(String email, String password) async {
    try {
      User user = (await firebaseAuth.signInWithEmailAndPassword(email: email, password: password))
          .user!;
      if(user!=null){
        //call database service update user data
        return true;
      }
    } on FirebaseAuthException catch (e) {
      //print(e);
      return e.message;
    }
  }

  //register function
  Future registerUserWithEmailandPassword(String fullName, String email, String password, String speciality, String phoneNumber) async {
    try {
      User user = (await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password))
          .user!;
      if(user!=null){
        //call database service update user data
        await DatabaseService(uid: user.uid).savingUserData(fullName, email, speciality, phoneNumber);
        print("data saved");
        return true;
      }
    } on FirebaseAuthException catch (e) {
      //print(e);
      return e.message;
    }
  }

  Future signOut() async {
    try{
      await HelperFunction.saveUserLoggedInStatus(false);
      await HelperFunction.saveUserNameSF("");
      await HelperFunction.saveUserEmailSF("");
      await firebaseAuth.signOut();
      //print("signed out successfully");
    } catch (e) {
      return null;
    }
  }

}