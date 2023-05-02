import 'package:bumble_bot/presentation/global/colors.dart';
import 'package:bumble_bot/presentation/global/fonts.dart';
import 'package:bumble_bot/presentation/global/size.dart';
import 'package:flutter/material.dart';

class BackButtonChat extends StatelessWidget {
  final String name;
  const BackButtonChat({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: sHeightBackButton(context) + 20,
      width: sWidthFull(context),
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child:
                const Icon(Icons.chevron_left_sharp, size: 24, color: cPremier),
          ),
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: cBlack,
              borderRadius: BorderRadius.circular(100),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 10),
            alignment: Alignment.centerLeft,
            height: sHeightBackButton(context),
            width: sWidthDynamic(context, 0.9) - 40 - 30,
            child: Text(name, style: h3(cBlack)),
          ),
        ],
      ),
    );
  }
}
