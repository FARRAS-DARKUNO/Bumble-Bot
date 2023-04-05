import 'package:bumble_bot/presentation/global/fonts.dart';
import 'package:bumble_bot/presentation/global/size.dart';
import 'package:flutter/material.dart';

import '../../global/colors.dart';

class CardProfileNotification extends StatelessWidget {
  const CardProfileNotification({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: cWhite,
        borderRadius: BorderRadius.circular(100),
        boxShadow: const [
          BoxShadow(
            color: cGray,
            blurRadius: 1,
            offset: Offset(0, 1), // Shadow position
          ),
        ],
      ),
      width: sWidthFull(context),
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: cBlack,
              borderRadius: BorderRadius.circular(100),
            ),
          ),
          SizedBox(
            width: sWidthDynamic(context, 0.8) - 50 - 30,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Hera Sugara Anata Katsuyo', style: h3(cBlack)),
                Text('@era Sugara Anata Katsuyo', style: h5(cGray))
              ],
            ),
          ),
          const Icon(Icons.notifications_rounded, size: 30, color: cPremier)
        ],
      ),
    );
  }
}
