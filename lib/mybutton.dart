import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
final void Function()? onTap;

  const MyButton({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 15.0),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 14, 18, 21), // Change color as needed
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Center(
            child: Text(
              'Sign In',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
