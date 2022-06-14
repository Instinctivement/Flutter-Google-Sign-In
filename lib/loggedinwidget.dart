import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in_demo/google_provider.dart';
import 'package:provider/provider.dart';

class LoggedInWidget extends StatelessWidget {
  const LoggedInWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Logged In'),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {
              final provider =
                  Provider.of<GoogleSignInProvider>(context, listen: false);
              provider.logout();
            },
            child: const Text("Logout"),
          ),
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        color: Colors.blueGrey.shade900,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Text(
            "Profile",
            style: TextStyle(fontSize: 24),
          ),
          const SizedBox(
            height: 32,
          ),
          CircleAvatar(
            radius: 80,
            backgroundImage: NetworkImage(user.photoURL!),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            "Name: " + user.displayName!,
            style: const TextStyle(fontSize: 16, color: Colors.white),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            "Email: " + user.email!,
            style: const TextStyle(fontSize: 16, color: Colors.white),
          ),
          const SizedBox(
            height: 8,
          ),
        ]),
      ),
    );
  }
}
