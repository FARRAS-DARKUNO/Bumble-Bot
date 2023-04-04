import 'package:bumble_bot/presentation/global/colors.dart';
import 'package:bumble_bot/presentation/global/fonts.dart';
import 'package:flutter/material.dart';

import '../../global/size.dart';
import '../../utils/list_reputation.dart';

class TokenDeployed extends StatelessWidget {
  const TokenDeployed({
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: sWidthDynamic(context, 0.21),
                    child: Text('Sikata Inu', style: h5(cBlack)),
                  ),
                  SizedBox(
                    width: sWidthDynamic(context, 0.17),
                    child: Row(
                      children: [
                        Text('Good ', style: h5(cBlack)),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: cGood,
                          ),
                          height: 12,
                          width: 12,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
