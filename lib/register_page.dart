import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sign_in/my_textfield.dart';
import 'package:sign_in/mybutton.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;

  RegisterPage({super.key , required this.onTap});
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmpasswordController = TextEditingController();
Future<void> signUserUp() async {
  showDialog(
    context: context,
    builder: (context) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    },
  );

  try {
    if (passwordController.text == confirmpasswordController.text){
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      // Registration successful, you might want to navigate to the next screen or perform any other actions here.
    } else {
      showErrorMessage("Passwords don't match");
    }
    Navigator.pop(context);
  } on FirebaseAuthException catch (e) {
    Navigator.pop(context);
    showErrorMessage(e.message!); // Using e.message instead of e.code for clearer error messages
  }
}

   
    void showErrorMessage(String message){
      showDialog(context: context,builder: (context) {
        return  AlertDialog(
          backgroundColor: Colors.amber,
          title: Center(child: Text(message,style: const TextStyle(color: Colors.white),),),
        );
       },
      );
     }
    


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 248, 248),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 50),
              const Icon(
                Icons.person,
                size: 100,
              ),
              const SizedBox(height: 20),
              const Text(
                'Register here',
                style: TextStyle(fontSize: 17),
              ),
              const SizedBox(height: 25),
              MyTextField(
                controller: emailController,
                hintText: 'Email',
                obscureText: false,
              ),
              const SizedBox(height: 13),
              MyTextField(
                controller: passwordController,
                hintText: 'Password',
                obscureText: true,
              ),
              MyTextField(
                controller: confirmpasswordController,
                hintText: 'Confirm Password',
                obscureText: true,
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        // Implement forgot password functionality here
                      },
                      child: const Text(
                        'Forgot password?',
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 5),
              MyButton(
                onTap: signUserUp,
              ),
              const SizedBox(height: 12),
              const Text('Or continue with:'),
              const SizedBox(height: 12),
              Image.asset('lib/images/google.png', height: 40),
               SizedBox(height: 25,),
                Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                    Text('Already Logged In?'),
                  GestureDetector(
                    onTap: widget.onTap,
            
                  child: Text('Login now!',style: TextStyle(color: Colors.blue),),
               ),],
              )
            ],
          ),
        ),
      ),
    );
  }
}
