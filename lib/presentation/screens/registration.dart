import 'package:bumble_bot/presentation/global/colors.dart';
import 'package:bumble_bot/presentation/global/fonts.dart';
import 'package:bumble_bot/presentation/widgets/box_input/password.dart';
import 'package:bumble_bot/presentation/widgets/box_input/text_normal_input.dart';
import 'package:bumble_bot/presentation/widgets/button/back_button.dart';
import 'package:bumble_bot/presentation/widgets/button/google_register.dart';
import 'package:flutter/material.dart';

import '../global/size.dart';
import '../widgets/box_input/number_normal_input.dart';

class Register extends StatelessWidget {
  const Register({
    Key? key,
  }) : super(key: key);

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
                const BackButtonCustome(),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  width: sWidthDynamic(context, 0.95),
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
                  child: Column(
                    children: <Widget>[
                      Text('Sign Up', style: h1(cPremier)),
                      const SizedBox(height: 20),
                      const TextNormalInput(hintText: 'Name'),
                      const SizedBox(height: 10),
                      const TextNormalInput(hintText: 'Username'),
                      const SizedBox(height: 10),
                      const TextNormalInput(hintText: 'Email'),
                      const SizedBox(height: 10),
                      const PasswordInput(hintText: 'Password'),
                      const SizedBox(height: 10),
                      const NumberNormalInput(hintText: 'Phone Number'),
                      const GoogleAndRegister(),
                      Text('Privacy Policy', style: h3(cPremier))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
