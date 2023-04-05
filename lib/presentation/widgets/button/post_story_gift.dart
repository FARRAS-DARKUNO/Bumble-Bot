import 'package:bumble_bot/presentation/global/colors.dart';
import 'package:bumble_bot/presentation/global/fonts.dart';
import 'package:bumble_bot/presentation/global/size.dart';
import 'package:bumble_bot/presentation/screens/gift_token.dart';
import 'package:bumble_bot/presentation/screens/story_post.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_custom/persistent-tab-view.dart';

class PostSroryGift extends StatelessWidget {
  const PostSroryGift({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: sWidthFull(context),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            width: sWidthDynamic(context, 0.3),
            height: 40,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: cPremier,
              boxShadow: [
                BoxShadow(
                  color: cGray,
                  blurRadius: 1,
                  offset: Offset(0, 1), // Shadow position
                ),
              ],
            ),
            child: Text('Post', style: h3(cWhite)),
          ),
          GestureDetector(
            onTap: () => gotoStory(context),
            child: Container(
              alignment: Alignment.center,
              width: sWidthDynamic(context, 0.3),
              height: 40,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: cWhite,
                boxShadow: [
                  BoxShadow(
                    color: cGray,
                    blurRadius: 1,
                    offset: Offset(0, 1), // Shadow position
                  ),
                ],
              ),
              child: Text('Story', style: h3(cYellow)),
            ),
          ),
          GestureDetector(
            onTap: () => gotoGift(context),
            child: Container(
              alignment: Alignment.center,
              width: sWidthDynamic(context, 0.3),
              height: 40,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: cWhite,
                boxShadow: [
                  BoxShadow(
                    color: cGray,
                    blurRadius: 1,
                    offset: Offset(0, 1), // Shadow position
                  ),
                ],
              ),
              child: Text('Gift', style: h3(cTersier)),
            ),
          ),
        ],
      ),
    );
  }
}

gotoStory(BuildContext context) {
  pushNewScreen(
    context,
    screen: const StoryPost(),
    withNavBar: true, // OPTIONAL VALUE. True by default.
    pageTransitionAnimation: PageTransitionAnimation.cupertino,
  );
}

gotoGift(BuildContext context) {
  pushNewScreen(
    context,
    screen: const GiftToken(),
    withNavBar: true, // OPTIONAL VALUE. True by default.
    pageTransitionAnimation: PageTransitionAnimation.cupertino,
  );
}
