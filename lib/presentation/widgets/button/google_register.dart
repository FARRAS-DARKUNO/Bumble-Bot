import 'package:bumble_bot/presentation/global/colors.dart';
import 'package:bumble_bot/presentation/global/fonts.dart';
import 'package:bumble_bot/presentation/global/size.dart';
import 'package:bumble_bot/presentation/widgets/alert/alert_dynamic.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../data/repository/introduction_repository.dart';
import '../../screens/splash_screen.dart';

class GoogleAndRegister extends StatefulWidget {
  final TextEditingController name;
  final TextEditingController username;
  final TextEditingController email;
  final TextEditingController password;
  final TextEditingController phone;
  const GoogleAndRegister({
    Key? key,
    required this.name,
    required this.username,
    required this.email,
    required this.password,
    required this.phone,
  }) : super(key: key);

  @override
  State<GoogleAndRegister> createState() => _GoogleAndRegisterState();
}

class _GoogleAndRegisterState extends State<GoogleAndRegister> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
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
            onTap: () => gotoGoogle(),
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
              child: Row(
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
            onTap: () => gotoRegister(context, widget.name, widget.username,
                widget.email, widget.password, widget.phone),
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
              child: Text('Register', style: h1(cWhite)),
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

gotoRegister(
  BuildContext context,
  TextEditingController name,
  TextEditingController username,
  TextEditingController email,
  TextEditingController password,
  TextEditingController phone,
) {
  if (name.value.text == '' ||
      username.value.text == '' ||
      email.value.text == '' ||
      password.value.text == '' ||
      phone.value.text == '') {
    alertDynamic(
      context,
      "Data Tidak Terisi",
      "Isi semua data terlebih dahulu",
    );
  } else {
    IntroductionRepository()
        .postRegserterRepo(
      email.value.text,
      password.value.text,
      name.value.text,
      username.value.text,
      phone.value.text,
    )
        .then((value) {
      if (value.status == 'success') {
        Navigator.pop(context);
        alertDynamic(context, value.status, value.message);
      } else {
        alertDynamic(context, "Terjadi Kesalahan", value.message);
      }
    });
  }
}
