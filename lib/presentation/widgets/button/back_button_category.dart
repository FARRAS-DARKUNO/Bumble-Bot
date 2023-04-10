import 'package:bumble_bot/presentation/global/colors.dart';
import 'package:bumble_bot/presentation/global/fonts.dart';
import 'package:bumble_bot/presentation/global/size.dart';
import 'package:flutter/material.dart';

class BackButtonCategoty extends StatelessWidget {
  final String category;
  const BackButtonCategoty({Key? key, required this.category})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: sHeightBackButton(context),
      width: sWidthFull(context),
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(Icons.chevron_left_sharp, size: 24, color: cPremier),
                Text('Back', style: h2(cPremier))
              ],
            ),
          ),
          Container(
            alignment: Alignment.center,
            height: sHeightBackButton(context),
            width: 90,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment(1, 0),
                colors: <Color>[cTersier, cPremier],
              ),
              borderRadius: BorderRadius.circular(100),
            ),
            child: Text(category, style: h4(cWhite)),
          ),
        ],
      ),
    );
  }
}
