import 'package:bumble_bot/data/repository/introduction_repository.dart';
import 'package:bumble_bot/presentation/global/colors.dart';
import 'package:bumble_bot/presentation/global/fonts.dart';
import 'package:bumble_bot/presentation/global/size.dart';
import 'package:bumble_bot/presentation/screens/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../alert/alert_dynamic.dart';

class GoogleAndLogin extends StatefulWidget {
  final TextEditingController password;
  final TextEditingController email;
  const GoogleAndLogin({
    Key? key,
    required this.email,
    required this.password,
  }) : super(key: key);

  @override
  State<GoogleAndLogin> createState() => _GoogleAndLoginState();
}

class _GoogleAndLoginState extends State<GoogleAndLogin> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    gotoLogin() async {
      try {
        await IntroductionRepository()
            .postLoginRepo(widget.email.value.text, widget.password.value.text)
            .then((value) async {
          final pref = await SharedPreferences.getInstance();
          await pref.setString('Token', value.token).then(
            (_) {
              gotoNext(context);
            },
          );
        });
      } catch (_) {
        alertDynamic(
          context,
          "Email atau Passord Salah",
          "Pastikan meninput email dan password yang benar",
        );
      }
    }

    gotoGoogle() async {
      try {
        await _googleSignIn.signIn().then((value) async {
          await IntroductionRepository()
              .postRegserterGoogleRepo(
                  value!.email, value.id, value.photoUrl ?? '')
              .then(
            (_) {
              IntroductionRepository()
                  .postLoginGoogleRepo(value.email, value.id)
                  .then((value) async {
                final pref = await SharedPreferences.getInstance();
                await pref.setString('Token', value.token).then(
                  (_) {
                    setState(() {
                      isLoading = false;
                    });
                    gotoNext(context);
                  },
                );
              });
            },
          );
        });
      } catch (error) {
        setState(() {
          isLoading = false;
        });
      }
    }

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      width: sWidthFull(context),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              isLoading ? null : gotoGoogle();
              gotoGoogle();
              setState(() {
                isLoading = true;
              });
            },
            child: Container(
              width: sWidthDynamic(context, 0.4),
              height: 40,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: cWhite,
                boxShadow: [
                  BoxShadow(
                    color: cGray,
                    blurRadius: 1,
                    offset: Offset(0, 1), // Shadow position
                  ),
                ],
              ),
              child: isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/images/google.png', scale: 9),
                        const SizedBox(width: 15),
                        Text('Google', style: h3(cPremier))
                      ],
                    ),
            ),
          ),
          GestureDetector(
            onTap: () => gotoLogin(),
            child: Container(
              alignment: Alignment.center,
              width: sWidthDynamic(context, 0.4),
              height: 40,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: cPremier,
                boxShadow: [
                  BoxShadow(
                    color: cGray,
                    blurRadius: 1,
                    offset: Offset(0, 1), // Shadow position
                  ),
                ],
              ),
              child: Text('Login', style: h1(cWhite)),
            ),
          )
        ],
      ),
    );
  }
}

final GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: [
    'email',
  ],
);

gotoNext(BuildContext context) {
  Navigator.of(context).push(CupertinoPageRoute<void>(
    builder: (BuildContext context) => const SplashScreen(),
  ));
}
