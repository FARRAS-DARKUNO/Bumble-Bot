import 'package:bumble_bot/presentation/global/fonts.dart';
import 'package:flutter/material.dart';

import '../../global/colors.dart';
import '../../global/size.dart';

class CardAmountCoint extends StatelessWidget {
  const CardAmountCoint({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: sWidthDynamic(context, 1) - 40,
        padding: const EdgeInsets.only(left: 10, right: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(width: 2, color: cPremier),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Column(
                children: [
                  Text('0', style: h1(cBlack)),
                  Text('BNB', style: h4(cBlack)),
                ],
              ),
              Column(
                children: [
                  Text('0', style: h1(cBlack)),
                  Text('BUMBLE', style: h4(cBlack)),
                ],
              )
            ],
          ),
        ));
  }
}
