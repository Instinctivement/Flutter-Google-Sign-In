import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in_demo/google_provider.dart';
import 'package:provider/provider.dart';

class SignUpWideget extends StatefulWidget {
  const SignUpWideget({Key? key}) : super(key: key);

  @override
  State<SignUpWideget> createState() => _SignUpWidegetState();
}

class _SignUpWidegetState extends State<SignUpWideget> {
  // final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  @override
  Widget build(BuildContext context) {
    // GoogleSignInAccount? user = _googleSignIn.currentUser;
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            const FlutterLogo(
              size: 120,
            ),
            const Spacer(),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Hey There, \nWelcome Back',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Login to your account to continue',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              ),
            ),
            const Spacer(),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  onPrimary: Colors.black,
                  minimumSize: const Size(double.infinity, 50)),
              onPressed: () {
                final provider =
                    Provider.of<GoogleSignInProvider>(context, listen: false);
                provider.googleLogin();
              },
              icon: const FaIcon(
                FontAwesomeIcons.google,
                color: Colors.red,
              ),
              label: const Text('Sign Up whith Google'),
            ),
            const SizedBox(
              height: 40,
            ),
            RichText(
                text: const TextSpan(
                    text: 'Already have an account? ',
                    style: TextStyle(color: Colors.white),
                    children: [
                  TextSpan(
                      text: 'Log in',
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.white))
                ])),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
