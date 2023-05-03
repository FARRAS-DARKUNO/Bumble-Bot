import 'package:bumble_bot/presentation/global/colors.dart';
import 'package:bumble_bot/presentation/global/fonts.dart';
import 'package:bumble_bot/presentation/global/size.dart';
import 'package:flutter/material.dart';

class BackButtonGroup extends StatelessWidget {
  final String name;
  final String totalPersonil;
  const BackButtonGroup({
    Key? key,
    required this.name,
    required this.totalPersonil,
  }) : super(key: key);

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
            child: const Icon(Icons.chevron_left_rounded,
                size: 24, color: cPremier),
          ),
          Container(
            padding: const EdgeInsets.only(left: 10),
            alignment: Alignment.centerLeft,
            height: sHeightBackButton(context),
            width: sWidthDynamic(context, 0.9) - 40 - 30,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: h3(cBlack)),
                const SizedBox(height: 5),
                Text("Total Member : $totalPersonil", style: h5(cGray)),
              ],
            ),
          ),
          const Icon(Icons.group_add_rounded, size: 30, color: cPremier)
        ],
      ),
    );
  }
}
