import 'package:bumble_bot/presentation/global/colors.dart';
import 'package:bumble_bot/presentation/global/fonts.dart';
import 'package:bumble_bot/presentation/global/size.dart';
import 'package:bumble_bot/presentation/screens/follower.dart';
import 'package:bumble_bot/presentation/screens/following.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_custom/persistent-tab-view.dart';

class FollowAndLike extends StatelessWidget {
  final String followers;
  final String following;
  final String username;
  const FollowAndLike({
    Key? key,
    required this.followers,
    required this.following,
    required this.username,
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
          GestureDetector(
            onTap: () => gotoFollower(context),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(followers, style: bigFonts(cWhite)),
                Text('Followers', style: h3(cWhite))
              ],
            ),
          ),
          GestureDetector(
            onTap: () => gotoFollowing(context),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(following, style: bigFonts(cWhite)),
                Text('Following', style: h3(cWhite))
              ],
            ),
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

  gotoFollower(BuildContext context) {
    pushNewScreen(
      context,
      screen: Followers(username: username),
      withNavBar: true, // OPTIONAL VALUE. True by default.
      pageTransitionAnimation: PageTransitionAnimation.cupertino,
    );
  }

  gotoFollowing(BuildContext context) {
    pushNewScreen(
      context,
      screen: Following(username: username),
      withNavBar: true, // OPTIONAL VALUE. True by default.
      pageTransitionAnimation: PageTransitionAnimation.cupertino,
    );
  }
}
