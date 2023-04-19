import 'package:bumble_bot/presentation/global/colors.dart';
import 'package:bumble_bot/presentation/global/fonts.dart';
import 'package:bumble_bot/presentation/widgets/box_input/address_scan.dart';
import 'package:bumble_bot/presentation/widgets/box_input/amount_dropdown.dart';
import 'package:bumble_bot/presentation/widgets/box_input/password.dart';
import 'package:bumble_bot/presentation/widgets/button/normal_button.dart';
import 'package:bumble_bot/presentation/widgets/card/card_amount_coint.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../global/size.dart';
import '../widgets/button/back_button.dart';
import '../widgets/information/my_token_address.dart';

class Withdraw extends StatefulWidget {
  const Withdraw({
    Key? key,
  }) : super(key: key);

  @override
  State<Withdraw> createState() => _WithdrawState();
}

class _WithdrawState extends State<Withdraw> {
  String walletToken = '';
  final password = TextEditingController();

  getToken() async {
    final pref = await SharedPreferences.getInstance();
    var wallet = pref.getString('Wallet') ?? '';
    setState(() {
      walletToken = wallet;
    });
  }

  @override
  void initState() {
    super.initState();

    getToken();
  }

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
                        infoAddress(context, walletToken),
                        const AddressScan(hintText: 'To Address'),
                        const SizedBox(height: 10),
                        const AmountDropdown(hintText: 'Amount'),
                        const SizedBox(height: 10),
                        PasswordInput(hintText: 'Password', text: password),
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
