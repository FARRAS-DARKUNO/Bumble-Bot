import 'package:bumble_bot/presentation/screens/snap_story.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_custom/persistent-tab-view.dart';

import '../../global/colors.dart';

class CardPostCircle extends StatelessWidget {
  const CardPostCircle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => gotoStory(context),
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        padding: const EdgeInsets.all(1),
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          color: cBlack,
          borderRadius: BorderRadius.circular(100),
          border: Border.all(color: cPremier, width: 4),
        ),
      ),
    );
  }
}

gotoStory(BuildContext context) {
  pushNewScreen(
    context,
    screen: const SnapStory(),
    withNavBar: false, // OPTIONAL VALUE. True by default.
    pageTransitionAnimation: PageTransitionAnimation.cupertino,
  );
}
