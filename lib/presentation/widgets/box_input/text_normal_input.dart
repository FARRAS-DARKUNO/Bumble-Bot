import 'package:flutter/material.dart';

import '../../global/colors.dart';
import '../../global/size.dart';

class TextNormalInput extends StatelessWidget {
  final String hintText;
  const TextNormalInput({Key? key, required this.hintText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: sWidthDynamic(context, 1) - 40,
      padding: const EdgeInsets.only(left: 10, right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        border: Border.all(width: 1, color: cPremier),
      ),
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
        ),
      ),
    );
  }
}
