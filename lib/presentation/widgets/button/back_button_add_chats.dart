import 'package:bumble_bot/presentation/global/colors.dart';
import 'package:bumble_bot/presentation/global/fonts.dart';
import 'package:bumble_bot/presentation/global/size.dart';
import 'package:flutter/material.dart';

class BackButtonAddChats extends StatelessWidget {
  const BackButtonAddChats({Key? key}) : super(key: key);
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
          const Icon(Icons.add_comment_rounded, color: cPremier, size: 30)
        ],
      ),
    );
  }
}
