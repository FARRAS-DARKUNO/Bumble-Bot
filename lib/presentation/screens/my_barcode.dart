import 'package:bumble_bot/presentation/widgets/card/card_amount_coint.dart';
import 'package:bumble_bot/presentation/widgets/card/card_profile_notification.dart';
import 'package:flutter/material.dart';
import '../global/colors.dart';
import '../global/fonts.dart';
import '../global/size.dart';
import '../widgets/button/back_button.dart';
import 'package:qr_flutter/qr_flutter.dart';

class MyBarcode extends StatelessWidget {
  const MyBarcode({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String text = 'aodolbdlcwbencobewnucbeiwbconweoiewnconacnio';
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
                    infoAddress(context, text),
                    buttonUI(context),
                    QrImage(
                      data: text,
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

Widget infoAddress(BuildContext context, String text) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 10),
    width: sWidthDynamic(context, 1) - 40,
    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      border: Border.all(width: 2, color: cPremier),
    ),
    child: Text(
      text,
      style: h3(cBlack),
      overflow: TextOverflow.ellipsis,
      textAlign: TextAlign.center,
      maxLines: 1,
    ),
  );
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
