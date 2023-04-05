import 'package:flutter/material.dart';

import '../../global/colors.dart';

class CardPostCircle extends StatelessWidget {
  const CardPostCircle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.all(1),
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        color: cBlack,
        borderRadius: BorderRadius.circular(100),
        border: Border.all(color: cPremier, width: 4),
      ),
    );
  }
}
