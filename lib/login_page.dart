// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sign_in/my_textfield.dart';
import 'package:sign_in/mybutton.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  void signUserIn() async {
    showDialog(context: context, builder: (context) {
      return const Center(child:CircularProgressIndicator(),);
    },);
    await FirebaseAuth.instance.signInWithEmailAndPassword(email:emailController.text , password: passwordController.text);

    Navigator.pop(context);

    try {
  await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: emailController.text,
    password: passwordController.text,
  );
  Navigator.pop(context);
} on FirebaseAuthException catch (e) {
  if (e.code == 'user-not-found') {
   showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text('Invalid Password'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('OK'),
          ),
        ],
      );
    },
  );
  } else if (e.code == 'wrong-password') {
   showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text('Invalid Email'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('OK'),
          ),
        ],
      );
    },
  );
  }
}

void throwwrongEmail() {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text('Invalid Email'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('OK'),
          ),
        ],
      );
    },
  );
}

void throwwrongPassword() {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text('Invalid Password'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('OK'),
          ),
        ],
      );
    },
  );
}

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 248, 248),
      body: SafeArea(
          child: Center(
        child: Column(
          children: [
            SizedBox(height: 50),
            Icon(
              Icons.person_2,
              size: 100,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Welcome Back, User',
              style: TextStyle(fontSize: 17),
            ),
            SizedBox(
              height: 25,
            ),
            MyTextField(
              controller: emailController,
              hintText: 'Email.',
              obscureText: false,
            ),
            SizedBox(height: 13),
            MyTextField(
              controller: passwordController,
              hintText: 'Password',
              obscureText: true,
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Forgot password?',
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            MyButton(
              onTap: signUserIn,
            ),
            SizedBox(height: 12,),
            Text('Or continue with:'),
            SizedBox(height: 12,),
            Image.asset('lib/images/google.png', height: 40, )
          ]
        ),
      )),
    );
  }
}
