import 'package:bumble_bot/presentation/global/colors.dart';
import 'package:bumble_bot/presentation/global/fonts.dart';
import 'package:bumble_bot/presentation/global/size.dart';
import 'package:bumble_bot/presentation/screens/list_user_to_add_group.dart';
import 'package:bumble_bot/presentation/widgets/navigation/navigation.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_custom/persistent-tab-view.dart';

class BackButtonAddChats extends StatelessWidget {
  const BackButtonAddChats({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: sHeightBackButton(context),
      width: sWidthFull(context),
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => gotoNavigator(context),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(Icons.chevron_left_sharp, size: 24, color: cPremier),
                Text('Back', style: h2(cPremier))
              ],
            ),
          ),
          GestureDetector(
            onTap: () => gotoAdd(context),
            child: const Icon(Icons.add_comment_rounded,
                color: cPremier, size: 30),
          )
        ],
      ),
    );
  }

  gotoAdd(BuildContext context) {
    pushNewScreen(
      context,
      screen: const ListUserToAddGroup(),
      withNavBar: false, // OPTIONAL VALUE. True by default.
      pageTransitionAnimation: PageTransitionAnimation.cupertino,
    );
  }

  gotoNavigator(BuildContext context) {
    pushNewScreen(
      context,
      screen: const Navigation(),
      withNavBar: false, // OPTIONAL VALUE. True by default.
      pageTransitionAnimation: PageTransitionAnimation.cupertino,
    );
  }
}
