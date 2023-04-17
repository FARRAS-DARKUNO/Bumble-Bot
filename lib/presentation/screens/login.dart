import 'package:bumble_bot/presentation/global/colors.dart';
import 'package:bumble_bot/presentation/global/fonts.dart';
import 'package:bumble_bot/presentation/screens/registration.dart';
import 'package:bumble_bot/presentation/widgets/box_input/password.dart';
import 'package:bumble_bot/presentation/widgets/box_input/text_normal_input.dart';
import 'package:bumble_bot/presentation/widgets/button/google_login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../global/size.dart';

class Login extends StatefulWidget {
  const Login({
    Key? key,
  }) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final email = TextEditingController();

  final password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 100),
                Container(
                  alignment: Alignment.center,
                  child: Image.asset('assets/images/welcome.png', scale: 3.5),
                ),
                Text("Login", style: bigFonts(cPremier)),
                const SizedBox(height: 10),
                TextNormalInput(hintText: 'Email', text: email),
                const SizedBox(height: 10),
                PasswordInput(hintText: 'Password', text: password),
                const SizedBox(height: 10),
                Container(
                  alignment: Alignment.centerRight,
                  width: sWidthDynamic(context, 1) - 40,
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Text('Forget Password?', style: h4(cPremier)),
                ),
                GoogleAndLogin(email: email, password: password),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Dont have an account?   ', style: h4(cBlack)),
                    GestureDetector(
                      onTap: () => gotoRegister(context),
                      child: Text('Register', style: h4(cPremier)),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

gotoRegister(BuildContext context) {
  Navigator.of(context).push(CupertinoPageRoute<void>(
    title: "Click me",
    builder: (BuildContext context) => Register(),
  ));
}
