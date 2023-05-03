import 'package:bumble_bot/presentation/global/colors.dart';
import 'package:bumble_bot/presentation/global/fonts.dart';
import 'package:flutter/material.dart';

import '../../global/size.dart';

class UserGroup extends StatelessWidget {
  final String message;

  const UserGroup({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topRight,
      width: sWidthFull(context),
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            constraints: BoxConstraints(maxWidth: sWidthDynamic(context, 0.7)),
            decoration: BoxDecoration(
              color: cPremier,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                // Container(
                //   height: 150,
                //   width: sWidthDynamic(context, 0.7) - 15 * 2,
                //   color: cBlack,
                // ),
                // const SizedBox(height: 5),
                Text(
                  message,
                  style: h4(cWhite),
                  textAlign: TextAlign.start,
                ),
              ],
            ),
          ),
          // const SizedBox(height: 5),
          // Text(
          //   '02:02:91 20-29-1992',
          //   style: h5(cGray),
          //   textAlign: TextAlign.start,
          // ),
        ],
      ),
    );
  }
}
