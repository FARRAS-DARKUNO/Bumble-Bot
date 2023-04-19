import 'package:bumble_bot/presentation/widgets/card/card_amount_coint.dart';
import 'package:bumble_bot/presentation/widgets/card/card_profile_notification.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../global/colors.dart';
import '../global/fonts.dart';
import '../global/size.dart';
import '../widgets/button/back_button.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../widgets/information/my_token_address.dart';

class MyBarcode extends StatefulWidget {
  const MyBarcode({
    Key? key,
  }) : super(key: key);

  @override
  State<MyBarcode> createState() => _MyBarcodeState();
}

class _MyBarcodeState extends State<MyBarcode> {
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
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            const BackButtonCustome(),
            SizedBox(
              height: sHeightScreen(context) - sHeightBackButton(context),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const CardProfileNotification(),
                    const CardAmountCoint(),
                    infoAddress(context, walletToken),
                    buttonUI(context),
                    QrImage(
                      data: walletToken,
                      version: QrVersions.auto,
                      size: 200.0,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget buttonUI(BuildContext context) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 10),
    width: sWidthFull(context),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        GestureDetector(
          child: Container(
            alignment: Alignment.center,
            width: sWidthDynamic(context, 0.3),
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
            child: Text('Deposit', style: h3(cTersier)),
          ),
        ),
        const SizedBox(width: 10),
        GestureDetector(
          child: Container(
            alignment: Alignment.center,
            width: sWidthDynamic(context, 0.3),
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
            child: Text('Withdraw', style: h3(cYellow)),
          ),
        ),
      ],
    ),
  );
}
