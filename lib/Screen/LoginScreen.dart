import 'package:chat_app2/Service/AuthSrevice.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:chat_app2/Screen/ChatScreen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final Duration loginTime = const Duration(milliseconds: 2250);
   late String email,password;
  Future<String?> _authUser(LoginData data) async {
    email=data.name;

    return await AuthSrevice().LoginResquest(data);
  }


  Future<String?> _signupUser(SignupData data) async {
    email=data.name!;
    return await AuthSrevice().SignupRequest(data);
  }


  Future<String?> _recoverPassword(String email) async {
    return await AuthSrevice().RecoverpasswordRequest(email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterLogin(
        title: 'ChatApp',
        theme: LoginTheme(
          primaryColor: Colors.blue,
          accentColor: Colors.white
        ),
        logo: const AssetImage('assets/loginlogo.jpg'),
        onLogin: _authUser,
        onSignup: _signupUser,
        onRecoverPassword: _recoverPassword,
        onSubmitAnimationCompleted: () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder:(context,) {
              return ChatScreen();
            },
            
            ),
          );
        },
      ),
    );
  }


}
