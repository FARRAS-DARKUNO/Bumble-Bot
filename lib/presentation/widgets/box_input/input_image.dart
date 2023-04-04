import 'package:flutter/material.dart';

import '../../global/colors.dart';
import '../../global/size.dart';

class InputImage extends StatelessWidget {
  const InputImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: sWidthDynamic(context, 1) - 40,
      height: 250,
      padding: const EdgeInsets.only(left: 10, right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        border: Border.all(width: 2, color: cPremier),
      ),
      child: const Icon(
        Icons.image,
        size: 150,
        color: cGray,
      ),
    );
  }
}
