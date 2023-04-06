import 'package:bumble_bot/presentation/global/fonts.dart';
import 'package:flutter/material.dart';

import '../../global/colors.dart';
import '../../global/size.dart';

class AddressScan extends StatelessWidget {
  final String hintText;
  const AddressScan({Key? key, required this.hintText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: sWidthDynamic(context, 1) - 40,
      padding: const EdgeInsets.only(left: 10, right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        border: Border.all(width: 2, color: cPremier),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: sWidthDynamic(context, 0.7),
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hintText,
              ),
            ),
          ),
          Container(
              alignment: Alignment.topLeft,
              width: sWidthDynamic(context, 0.1),
              child: const Icon(
                Icons.camera_alt_rounded,
                color: cTersier,
                size: 30,
              )),
        ],
      ),
    );
  }
}
