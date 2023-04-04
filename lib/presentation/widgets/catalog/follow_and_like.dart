import 'package:bumble_bot/presentation/global/colors.dart';
import 'package:bumble_bot/presentation/global/fonts.dart';
import 'package:bumble_bot/presentation/global/size.dart';
import 'package:flutter/material.dart';

class FollowAndLike extends StatelessWidget {
  const FollowAndLike({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: sWidthFull(context),
      height: 100,
      color: cPremier,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('0', style: bigFonts(cWhite)),
              Text('Followers', style: h3(cWhite))
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('0', style: bigFonts(cWhite)),
              Text('Following', style: h3(cWhite))
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('0', style: bigFonts(cWhite)),
              Text('Likes', style: h3(cWhite))
            ],
          ),
        ],
      ),
    );
  }
}
