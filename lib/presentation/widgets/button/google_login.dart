import 'package:bumble_bot/data/model/status_message_model.dart';
import 'package:bumble_bot/data/repository/introduction_repository.dart';
import 'package:bumble_bot/presentation/global/colors.dart';
import 'package:bumble_bot/presentation/global/fonts.dart';
import 'package:bumble_bot/presentation/global/size.dart';
import 'package:bumble_bot/presentation/widgets/navigation/navigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleAndLogin extends StatefulWidget {
  const GoogleAndLogin({
    Key? key,
  }) : super(key: key);

  @override
  State<GoogleAndLogin> createState() => _GoogleAndLoginState();
}

class _GoogleAndLoginState extends State<GoogleAndLogin> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    gotoLogin() {
      IntroductionRepository()
          .postLoginRepo("user1@example.com", "password")
          .then((value) {
        print(value);
      });
    }

    gotoGoogle() async {
      try {
        await _googleSignIn.signIn().then((value) async {
          IntroductionRepository()
              .postRegserterGoogleRepo(value!.email, value.id)
              .then((value) {
            print('halooooooooooooooooo senyaaaaaaaa $value');
          });

          // if (data.status == 'success') {
          //   print('Masuk ke dalam Pegister');
          //   setState(() {
          //     isLoading = false;
          //   });
          //   // gotoLogin();
          // }
          // if (data.message == "Email sudah terdaftar") {
          //   print('Masuk ke dalam Login');
          //   await IntroductionRepository()
          //       .postLoginGoogleRepo(value.email, value.id)
          //       .then((value) {
          //     print('Masuk ke dalam Login');
          //     setState(() {
          //       isLoading = false;
          //     });
          //   });
          // }
        });
      } catch (error) {
        print('Halooooooo $error');
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
              // isLoading ? null : gotoGoogle();
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
    title: "Click me",
    builder: (BuildContext context) => const Navigation(),
  ));
}
