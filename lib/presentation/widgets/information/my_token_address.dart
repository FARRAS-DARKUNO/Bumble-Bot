import 'package:flutter/cupertino.dart';
import '../../global/colors.dart';
import '../../global/fonts.dart';
import '../../global/size.dart';

Widget infoAddress(BuildContext context, String text) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 10),
    width: sWidthDynamic(context, 1) - 40,
    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      border: Border.all(width: 2, color: cPremier),
    ),
    child: Text(
      text,
      style: h3(cBlack),
      overflow: TextOverflow.ellipsis,
      textAlign: TextAlign.center,
      maxLines: 1,
    ),
  );
}
