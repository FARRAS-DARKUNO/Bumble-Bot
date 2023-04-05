import 'package:bumble_bot/presentation/global/colors.dart';
import 'package:bumble_bot/presentation/global/fonts.dart';
import 'package:bumble_bot/presentation/widgets/box_input/amount_dropdown.dart';
import 'package:bumble_bot/presentation/widgets/box_input/password.dart';
import 'package:bumble_bot/presentation/widgets/box_input/text_normal_input.dart';
import 'package:bumble_bot/presentation/widgets/button/normal_button.dart';
import 'package:bumble_bot/presentation/widgets/card/card_amount_coint.dart';
import 'package:flutter/material.dart';
import '../global/size.dart';
import '../widgets/button/back_button.dart';

class GiftToken extends StatelessWidget {
  const GiftToken({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: Column(
              children: <Widget>[
                const BackButtonCustome(),
                SizedBox(
                  height: sHeightScreen(context) - sHeightBackButton(context),
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      Text('Gift Token', style: h1(cPremier)),
                      const SizedBox(height: 30),
                      const CardAmountCoint(),
                      const SizedBox(height: 10),
                      const TextNormalInput(hintText: 'To Username'),
                      const SizedBox(height: 10),
                      const AmountDropdown(hintText: 'Amount'),
                      const SizedBox(height: 10),
                      const PasswordInput(hintText: 'Password'),
                      const SizedBox(height: 30),
                      const NormalButton(title: 'Submit'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
