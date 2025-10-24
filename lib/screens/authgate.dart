// screens/auth_gate.dart
// Decides which screen to show based on authentication state.

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:taskapp/screens/home.dart';
import 'package:taskapp/screens/signin.dart';


class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        // Loading indicator while checking auth state
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        // If user is logged in, show HomeScreen
        if (snapshot.hasData) {
          return const HomeScreen();
        }

        // Otherwise, show SignInScreen
        return const SignInScreen();
      },
    );
  }
}
