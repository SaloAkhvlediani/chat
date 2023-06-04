import 'package:chatapp_firebase2/service/database_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'dart:async';

class AuthSetvice {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  //Login function

  //register function
  Future registerUserWithEmailandPassword(
      String fullName, String email, String password) async {
    try {
      User user = (await firebaseAuth.createUserWithEmailAndPassword(
              email: email, password: password))
          .user!;

      if (user != null) {
        //call database service to update the user data
        await DatabaseService(uid: user.uid).updataUserData(fullName, email);

        return true;
      }
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  //singout function
}
