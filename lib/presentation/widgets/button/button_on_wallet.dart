import 'package:bumble_bot/presentation/global/size.dart';
import 'package:flutter/material.dart';

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
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: cPremier,
              borderRadius: BorderRadius.circular(100),
            ),
            child: const Icon(Icons.arrow_upward, size: 30, color: cWhite),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: cTersier,
              borderRadius: BorderRadius.circular(100),
            ),
            child: const Icon(Icons.arrow_downward, size: 30, color: cWhite),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: cTersier,
              borderRadius: BorderRadius.circular(100),
            ),
            child: const Icon(Icons.history, size: 30, color: cWhite),
          ),
        ],
      ),
    );
  }
}
