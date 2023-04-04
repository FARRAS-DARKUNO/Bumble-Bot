import 'package:bumble_bot/presentation/global/fonts.dart';
import 'package:bumble_bot/presentation/global/size.dart';
import 'package:flutter/material.dart';

import '../../global/colors.dart';

class NormalButton extends StatelessWidget {
  final String title;
  const NormalButton({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: sWidthFull(context) - 40,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        gradient: const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment(1, 0),
          colors: <Color>[cTersier, cPremier],
        ),
      ),
      child: Text(title, style: button(cWhite)),
    );
  }
}
