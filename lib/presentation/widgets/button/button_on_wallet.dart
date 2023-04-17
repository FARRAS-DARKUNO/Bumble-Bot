import 'package:bumble_bot/presentation/global/size.dart';
import 'package:bumble_bot/presentation/screens/history_wallet.dart';
import 'package:bumble_bot/presentation/screens/my_barcode.dart';
import 'package:bumble_bot/presentation/screens/withdraw.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_custom/persistent-tab-view.dart';

import '../../global/colors.dart';

class ButtonOnWallet extends StatelessWidget {
  const ButtonOnWallet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      width: sWidthFull(context),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          GestureDetector(
            onTap: () => gotoBarcode(context),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: cPremier,
                borderRadius: BorderRadius.circular(100),
              ),
              child: const Icon(Icons.arrow_upward, size: 30, color: cWhite),
            ),
          ),
          GestureDetector(
            onTap: () => gotoWithdraw(context),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: cTersier,
                borderRadius: BorderRadius.circular(100),
              ),
              child: const Icon(Icons.arrow_downward, size: 30, color: cWhite),
            ),
          ),
          GestureDetector(
            onTap: () => gotoHistory(context),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: cTersier,
                borderRadius: BorderRadius.circular(100),
              ),
              child: const Icon(Icons.history, size: 30, color: cWhite),
            ),
          ),
        ],
      ),
    );
  }
}

gotoBarcode(BuildContext context) {
  pushNewScreen(
    context,
    screen: const MyBarcode(),
    withNavBar: true, // OPTIONAL VALUE. True by default.
    pageTransitionAnimation: PageTransitionAnimation.cupertino,
  );
}

gotoWithdraw(BuildContext context) {
  pushNewScreen(
    context,
    screen: Withdraw(),
    withNavBar: true, // OPTIONAL VALUE. True by default.
    pageTransitionAnimation: PageTransitionAnimation.cupertino,
  );
}

gotoHistory(BuildContext context) {
  pushNewScreen(
    context,
    screen: const HistoryWallet(),
    withNavBar: true, // OPTIONAL VALUE. True by default.
    pageTransitionAnimation: PageTransitionAnimation.cupertino,
  );
}
