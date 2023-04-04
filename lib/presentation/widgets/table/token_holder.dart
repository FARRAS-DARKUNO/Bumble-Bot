import 'package:bumble_bot/presentation/global/colors.dart';
import 'package:bumble_bot/presentation/global/fonts.dart';
import 'package:flutter/material.dart';

import '../../global/size.dart';

class TokenHolder extends StatelessWidget {
  const TokenHolder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Token Holder', style: semiTitle(cBlack)),
        const SizedBox(height: 10),
        Container(
          width: sWidthDynamic(context, 0.5) - 22,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: cPremier, width: 1),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Total : 1000000', style: h4(cBlack)),
              const SizedBox(height: 10),
              Text('10 BNB', style: h4(cBlack)),
              const SizedBox(height: 10),
              Text('23.000 USDT', style: h4(cBlack)),
              const SizedBox(height: 10),
              Text('122.221.000 Numble', style: h4(cBlack)),
            ],
          ),
        ),
      ],
    );
  }
}
