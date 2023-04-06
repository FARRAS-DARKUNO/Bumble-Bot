import 'package:bumble_bot/presentation/global/colors.dart';
import 'package:bumble_bot/presentation/global/fonts.dart';
import 'package:bumble_bot/presentation/widgets/box_input/address_scan.dart';
import 'package:bumble_bot/presentation/widgets/box_input/amount_dropdown.dart';
import 'package:bumble_bot/presentation/widgets/box_input/password.dart';
import 'package:bumble_bot/presentation/widgets/box_input/text_normal_input.dart';
import 'package:bumble_bot/presentation/widgets/button/normal_button.dart';
import 'package:bumble_bot/presentation/widgets/card/card_amount_coint.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import '../global/size.dart';
import '../widgets/button/back_button.dart';
import '../widgets/information/my_token_address.dart';

class Withdraw extends StatelessWidget {
  const Withdraw({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(
      builder: (context, isKeyboardVisible) => GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: Column(
              children: <Widget>[
                const BackButtonCustome(),
                SizedBox(
                  height: sHeightScreen(context) - sHeightBackButton(context),
                  child: SingleChildScrollView(
                    reverse: isKeyboardVisible,
                    child: Column(
                      children: [
                        const SizedBox(height: 10),
                        Text('WithDraw', style: h1(cPremier)),
                        const SizedBox(height: 30),
                        const CardAmountCoint(),
                        infoAddress(
                            context, 'ahshdashdkjashdkashdkajsdhasjkdhs'),
                        const AddressScan(hintText: 'To Address'),
                        const SizedBox(height: 10),
                        const AmountDropdown(hintText: 'Amount'),
                        const SizedBox(height: 10),
                        const PasswordInput(hintText: 'Password'),
                        const SizedBox(height: 30),
                        const NormalButton(title: 'Submit'),
                        sPaddingBottom(context),
                      ],
                    ),
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
