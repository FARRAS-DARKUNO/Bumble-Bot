import 'package:flutter/material.dart';

import '../../global/colors.dart';
import '../../global/size.dart';

class PasswordInput extends StatelessWidget {
  final TextEditingController text;
  final String hintText;
  const PasswordInput({
    Key? key,
    required this.hintText,
    required this.text,
  }) : super(key: key);

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
        obscureText: true,
        enableSuggestions: false,
        autocorrect: false,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
        ),
      ),
    );
  }
}
