import 'package:bumble_bot/presentation/global/colors.dart';
import 'package:bumble_bot/presentation/global/size.dart';
import 'package:flutter/material.dart';

class SearchWaletScreening extends StatelessWidget {
  const SearchWaletScreening({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          width: sWidthDynamic(context, 0.8) - 22,
          margin: const EdgeInsets.only(left: 20),
          padding: const EdgeInsets.only(left: 10, right: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            border: Border.all(width: 1, color: cPremier),
          ),
          child: const TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Search Wallet',
            ),
          ),
        ),
        Container(
          width: sWidthDynamic(context, 0.2) - 22,
          height: sWidthDynamic(context, 0.2) - 22,
          margin: const EdgeInsets.only(right: 20),
          decoration: BoxDecoration(
            color: cTersier,
            borderRadius: BorderRadius.circular(40),
            border: Border.all(width: 1, color: cGray),
            // color: cWhite,
          ),
          child: const Icon(Icons.camera_alt_rounded, color: cWhite),
        ),
      ],
    );
  }
}
