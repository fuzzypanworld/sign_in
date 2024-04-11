import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
 Homepage({super.key});

  final user = FirebaseAuth.instance.currentUser!;

  void signUserOut() {
    FirebaseAuth.instance.signOut();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions:[IconButton(onPressed: signUserOut, icon: const Icon(Icons.logout_outlined))] ,),
      body: Center (child: Text("LOGGED IN AS: ${user.email}")),
    );
  }
} 