import 'package:bumble_bot/presentation/screens/login.dart';
import 'package:bumble_bot/presentation/widgets/navigation/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../global/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

getToken(context) async {
  final pref = await SharedPreferences.getInstance();
  var token = pref.getString('Token') ?? '';

  if (token == '') {
    Future.delayed(const Duration(seconds: 3)).then((value) => {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Login(),
              ))
        });
  } else {
    Future.delayed(const Duration(seconds: 3)).then((value) => {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Navigation(),
              ))
        });
  }
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    getToken(context);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: cWhite,
    ));
    return Scaffold(
      body: Container(
        color: cWhite,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Image.asset('assets/images/logo.jpeg', scale: 3),
      ),
    );
  }
}
