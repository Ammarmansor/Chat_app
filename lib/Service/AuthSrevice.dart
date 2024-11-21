import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_login/flutter_login.dart';

class AuthSrevice {


  Future<String?> SignupRequest(SignupData data) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: data.name!,
        password: data.password!,
      );
      return null; // Signup successful
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        return 'The account already exists for that email.';
      } else if (e.code == 'invalid-email') {
        return 'Invalid email address.';
      }
      return 'Signup failed: ${e.message}';
    } catch (e) {
      return 'An unknown error occurred: $e';
    }
  }
  
  Future<String?> LoginResquest(LoginData data) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: data.name,
        password: data.password,
      );
      return null;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        return 'Wrong password provided for that user.';
      }
      return 'Login failed: ${e.message}';
    } catch (e) {
      return 'An unknown error occurred: $e';
    }
  }
  
  Future<String?> RecoverpasswordRequest(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      return null; // Recovery email sent successfully
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return 'No user found for that email.';
      }
      return 'Password recovery failed: ${e.message}';
    } catch (e) {
      return 'An unknown error occurred: $e';
    }
  }


}