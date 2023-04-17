import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../global/colors.dart';
import '../../global/size.dart';

class NumberNormalInput extends StatelessWidget {
  final String hintText;
  final TextEditingController text;
  const NumberNormalInput(
      {Key? key, required this.hintText, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: sWidthDynamic(context, 1) - 40,
      padding: const EdgeInsets.only(left: 10, right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        border: Border.all(width: 2, color: cPremier),
      ),
      child: TextField(
        controller: text,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
        ),
      ),
    );
  }
}
