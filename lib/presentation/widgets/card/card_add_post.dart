import 'package:bumble_bot/presentation/screens/story_post.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_custom/persistent-tab-view.dart';

import '../../global/colors.dart';

class CardAddPost extends StatelessWidget {
  const CardAddPost({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 10),
      padding: const EdgeInsets.all(1),
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        color: cBlack,
        borderRadius: BorderRadius.circular(100),
        border: Border.all(color: cPremier, width: 4),
      ),
      child: GestureDetector(
        onTap: () => gotoStory(context),
        child: Container(
          transform: Matrix4.translationValues(20.0, 15.0, 0.0),
          child: Image.asset('assets/images/add.png'),
        ),
      ),
    );
  }
}

gotoStory(BuildContext context) {
  pushNewScreen(
    context,
    screen: StoryPost(),
    withNavBar: true, // OPTIONAL VALUE. True by default.
    pageTransitionAnimation: PageTransitionAnimation.cupertino,
  );
}
