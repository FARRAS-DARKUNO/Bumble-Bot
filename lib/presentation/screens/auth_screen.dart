// import 'package:bumble_bot/presentation/screens/login.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// import '../widgets/navigation/navigation.dart';

// class AuthScreen extends StatelessWidget {
//   const AuthScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: StreamBuilder<User?>(
//           stream: FirebaseAuth.instance.authStateChanges(),
//           builder: (context, snapshot) {
//             // user is logged in
//             if (snapshot.hasData) {
//               return const Navigation();
//             }
//             // user is not logged in
//             else {
//               return const Login();
//             }
//           }),
//     );
//   }
// }
