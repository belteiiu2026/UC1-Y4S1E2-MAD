
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mad/forget_password_screen.dart';
import 'package:mad/main.dart';
import 'package:mad/widgets/app_logo.dart' as appLogo;

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  bool _obscureText = true;
  bool _isEmailValid = false;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();



  void _onEmailChangeHandler(String email){
      if(email.isNotEmpty && email.contains("@")){
        setState(() {
          _isEmailValid = true;
        });
      }else{
        setState(() {
          _isEmailValid = false;
        });
      }
  }

  final _keyForm = GlobalKey<FormState>();


  void _onLoginSubmitHandler(){
    print("Email  : ${emailController.text}");
    print("Password : ${passwordController.text}");
    if(_keyForm.currentState!.validate()){
        // Can submit to Backend API.
    }
  }


  @override
  Widget build(BuildContext context) {


    final customLogo = SizedBox(
      height: 300,
      child: appLogo.logo,
    );

    final usernameTextField = Padding(
      padding: EdgeInsets.all(8),
      child: TextFormField(
        controller: emailController,
        onChanged: _onEmailChangeHandler,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.mail),
        suffixIcon: _isEmailValid ?  Icon(Icons.check_circle, color: Colors.green,) :  Icon(Icons.check_circle),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30)
        ),
        hintText: "Email"
      ),
        validator: (v){
          if(v!.isEmpty){
            return "Email could not be blank.";
          }
          return null;
        },
    )
    );
    final passwordTextField = Padding(
        padding: EdgeInsets.all(8),
        child: TextFormField(
          controller: passwordController,
      obscureText: _obscureText,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.lock),
          suffixIcon: IconButton(onPressed: (){
            setState(() {
              _obscureText = !_obscureText;
            });
          }, icon: _obscureText ? Icon(Icons.visibility_off) : Icon(Icons.visibility)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30)
          ),
          hintText: "Password",
      ),
          validator: (v){
            if(v!.isEmpty){
              return "Password could not be blank.";
            }
            return null;
          },
    )
    );

    final loginButton = Padding(padding: EdgeInsets.only(left: 8, right: 8, bottom: 16),
      child: SizedBox(
        height: 50,
        width: MediaQuery.of(context).size.width,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF3051A0)
            ),
            onPressed: _onLoginSubmitHandler
            , child: Text("ចូលប្រើ", style: TextStyle(color: Colors.white),)),
      ),);


    final forgetPassword = Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(onPressed: (){
          final route = MaterialPageRoute(builder: (BuildContext context) => ForgetPasswordScreen());
          Navigator.push(context, route);
        }, child: Text("ភ្លេចលេខសង្ងាត់"))
      ],
    );


    final loginForm = Form(
        key: _keyForm,
        child: Column(
          children: [
            usernameTextField,
            passwordTextField,
            forgetPassword
          ],
        ),
      );




    return Scaffold(
      body: Column(
        children: [
          customLogo,
          loginForm,
          loginButton
        ],
      ),
    );
  }
}
