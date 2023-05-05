import 'package:bumble_bot/presentation/screens/story_post.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_custom/persistent-tab-view.dart';

import '../../../data/api/base_url.dart';
import '../../global/colors.dart';
import '../../screens/snap_story.dart';

class CardAddPost extends StatelessWidget {
  final String username;
  final String image;
  const CardAddPost({Key? key, required this.username, required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => gotoSnap(context),
      child: Container(
        margin: const EdgeInsets.only(left: 20, right: 10),
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
        child: Container(
          transform: Matrix4.translationValues(20.0, 15.0, 0.0),
          child: GestureDetector(
            onTap: () => gotoStory(context),
            child: Image.asset('assets/images/add.png'),
          ),
        ),
      ),
    );
  }

  gotoSnap(BuildContext context) {
    pushNewScreen(
      context,
      screen: SnapStory(username: username),
      withNavBar: false, // OPTIONAL VALUE. True by default.
      pageTransitionAnimation: PageTransitionAnimation.cupertino,
    );
  }

  gotoStory(BuildContext context) {
    pushNewScreen(
      context,
      screen: const StoryPost(),
      withNavBar: true, // OPTIONAL VALUE. True by default.
      pageTransitionAnimation: PageTransitionAnimation.cupertino,
    );
  }
}
