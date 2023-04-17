import 'package:flutter/material.dart';

import '../../global/colors.dart';
import '../../global/size.dart';

class TextNormalInput extends StatefulWidget {
  final TextEditingController text;
  final String hintText;
  const TextNormalInput({
    Key? key,
    required this.text,
    required this.hintText,
  }) : super(key: key);

  @override
  State<TextNormalInput> createState() => _TextNormalInputState();
}

class _TextNormalInputState extends State<TextNormalInput> {
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
        controller: widget.text,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: widget.hintText,
        ),
      ),
    );
  }
}
