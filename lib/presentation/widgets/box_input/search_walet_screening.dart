import 'package:bumble_bot/presentation/global/colors.dart';
import 'package:bumble_bot/presentation/global/size.dart';
import 'package:bumble_bot/presentation/screens/detail_coint.dart';
import 'package:bumble_bot/presentation/screens/qr_code_scanner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:persistent_bottom_nav_bar_custom/persistent-tab-view.dart';

class SearchWaletScreening extends StatelessWidget {
  final TextEditingController text;
  const SearchWaletScreening({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(
      builder: (context, isKeyboardVisible) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            width: sWidthDynamic(context, 0.8) - 22,
            margin: const EdgeInsets.only(left: 20),
            padding: const EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              border: Border.all(width: 1, color: cPremier),
            ),
            child: TextField(
              controller: text,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Search Wallet',
              ),
            ),
          ),
          text.value.text == '' && isKeyboardVisible == false
              ? GestureDetector(
                  onTap: () => gotoScane(context),
                  child: Container(
                    width: sWidthDynamic(context, 0.2) - 22,
                    height: sWidthDynamic(context, 0.2) - 22,
                    margin: const EdgeInsets.only(right: 20),
                    decoration: BoxDecoration(
                      color: cTersier,
                      borderRadius: BorderRadius.circular(40),
                      border: Border.all(width: 1, color: cGray),
                      // color: cWhite,
                    ),
                    child: const Icon(Icons.camera_alt_rounded, color: cWhite),
                  ),
                )
              : GestureDetector(
                  onTap: () => gotoDetail(context),
                  child: Container(
                    width: sWidthDynamic(context, 0.2) - 22,
                    height: sWidthDynamic(context, 0.2) - 22,
                    margin: const EdgeInsets.only(right: 20),
                    decoration: BoxDecoration(
                      color: cTersier,
                      borderRadius: BorderRadius.circular(40),
                      border: Border.all(width: 1, color: cGray),
                      // color: cWhite,
                    ),
                    child: const Icon(Icons.send, color: cWhite),
                  ),
                )
        ],
      ),
    );
  }

  gotoScane(BuildContext context) {
    pushNewScreen(
      context,
      screen: const QRCodeScanner(),
      withNavBar: true, // OPTIONAL VALUE. True by default.
      pageTransitionAnimation: PageTransitionAnimation.cupertino,
    );
  }

  gotoDetail(BuildContext context) {
    if (text.value.text != '') {
      pushNewScreen(
        context,
        screen: DetailCoint(resultScanne: text.value.text),
        withNavBar: true, // OPTIONAL VALUE. True by default.
        pageTransitionAnimation: PageTransitionAnimation.cupertino,
      );
    }
  }
}
