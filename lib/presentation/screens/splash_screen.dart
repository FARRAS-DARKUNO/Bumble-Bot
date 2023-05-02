import 'package:bumble_bot/data/repository/fcm_repositoty.dart';
import 'package:bumble_bot/data/repository/profile_repository.dart';
import 'package:bumble_bot/presentation/screens/login.dart';
import 'package:bumble_bot/presentation/widgets/navigation/navigation.dart';
import 'package:fcm_config/fcm_config.dart';
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

gotoLogin(context) {
  Future.delayed(const Duration(seconds: 3)).then((value) => {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Login(),
            ))
      });
}

gotoNext(context) {
  Future.delayed(const Duration(seconds: 3)).then((value) => {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Navigation(),
            ))
      });
}

getToken(context) async {
  final pref = await SharedPreferences.getInstance();
  var token = pref.getString('Token') ?? '';

  if (token == '') {
    gotoLogin(context);
  } else {
    try {
      var tokenFCM = await FCMConfig.instance.messaging.getToken();

      await FCMRepository().updateFCMRepo(tokenFCM!);
      await ProfileRepository().getProfileRepo().then((value) async {
        await pref.setString('Wallet', value.data.wallet);
        await pref.setString('Email', value.data.email);
        await pref.setString('Username', value.data.username);
        gotoNext(context);
      });
    } catch (_) {
      gotoLogin(context);
    }
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
