import 'package:bumble_bot/presentation/global/colors.dart';
import 'package:bumble_bot/presentation/global/fonts.dart';
import 'package:bumble_bot/presentation/widgets/button/button_on_wallet.dart';
import 'package:bumble_bot/presentation/widgets/card/card_wallet.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../global/size.dart';
import '../widgets/box_input/amount_dropdown.dart';
import '../widgets/box_input/password.dart';
import '../widgets/box_input/text_normal_input.dart';
import '../widgets/button/normal_button.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  final username = TextEditingController();
  final password = TextEditingController();
  String walletToken = '';

  getTokenWalet() async {
    final pref = await SharedPreferences.getInstance();
    var wallet = pref.getString('Wallet') ?? '';
    setState(() {
      walletToken = wallet;
    });
  }

  @override
  void initState() {
    super.initState();

    getTokenWalet();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: SizedBox(
            height: sHeightScreen(context),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  waletUi(context, walletToken),
                  const CardWallet(),
                  const ButtonOnWallet(),
                  const SizedBox(height: 10),
                  Text('Gift Token', style: h1(cPremier)),
                  const SizedBox(height: 10),
                  const SizedBox(height: 10),
                  TextNormalInput(hintText: 'To Username', text: username),
                  const SizedBox(height: 10),
                  const AmountDropdown(hintText: 'Amount'),
                  const SizedBox(height: 10),
                  PasswordInput(hintText: 'Password', text: password),
                  const SizedBox(height: 30),
                  const NormalButton(title: 'Submit'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget waletUi(BuildContext context, String tokenWallet) {
  return Container(
    padding: const EdgeInsets.all(20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text('Wallet', style: h1(cBlack)),
        Container(
          width: sWidthDynamic(context, 0.65),
          height: 35,
          padding: const EdgeInsets.only(left: 10, right: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            border: Border.all(width: 2, color: cGray),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(
                width: sWidthDynamic(context, 0.64) - 24 - 30,
                child: Text(
                  tokenWallet,
                  style: h5(cGray),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              GestureDetector(
                onTap: () => onCopy(tokenWallet),
                child: const Icon(
                  Icons.copy,
                  color: cTersier,
                  size: 24,
                ),
              )
            ],
          ),
        )
      ],
    ),
  );
}

onCopy(String text) async {
  await Clipboard.setData(ClipboardData(text: text));
}
