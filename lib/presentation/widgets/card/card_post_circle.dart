import 'package:bumble_bot/data/api/base_url.dart';
import 'package:bumble_bot/presentation/screens/snap_story.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_custom/persistent-tab-view.dart';

import '../../global/colors.dart';

class CardPostCircle extends StatelessWidget {
  final String username;
  final String image;
  const CardPostCircle({Key? key, required this.image, required this.username})
      : super(key: key);

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
          image: DecorationImage(
            image: NetworkImage('$imageUrl$image'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  gotoStory(BuildContext context) {
    pushNewScreen(
      context,
      screen: SnapStory(username: username),
      withNavBar: false, // OPTIONAL VALUE. True by default.
      pageTransitionAnimation: PageTransitionAnimation.cupertino,
    );
  }
}
