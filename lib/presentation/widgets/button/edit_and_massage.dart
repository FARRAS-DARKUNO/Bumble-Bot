import 'package:bumble_bot/presentation/global/colors.dart';
import 'package:bumble_bot/presentation/global/fonts.dart';
import 'package:bumble_bot/presentation/global/size.dart';
import 'package:bumble_bot/presentation/screens/edit_profile.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_custom/persistent-tab-view.dart';

class EditAndMassage extends StatelessWidget {
  const EditAndMassage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      width: sWidthFull(context),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          GestureDetector(
            onTap: () => gotoEdit(context),
            child: Container(
              width: sWidthDynamic(context, 0.4),
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.edit, color: cTersier, size: 30),
                  const SizedBox(width: 15),
                  Text('Edit', style: h3(cTersier))
                ],
              ),
            ),
          ),
          Container(
            width: sWidthDynamic(context, 0.4),
            height: 40,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: cTersier,
              boxShadow: [
                BoxShadow(
                  color: cGray,
                  blurRadius: 1,
                  offset: Offset(0, 1), // Shadow position
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.message, color: cWhite, size: 30),
                const SizedBox(width: 15),
                Text('Message', style: h3(cWhite))
              ],
            ),
          )
        ],
      ),
    );
  }
}

gotoEdit(BuildContext context) {
  pushNewScreen(
    context,
    screen: const EditProfile(),
    withNavBar: true, // OPTIONAL VALUE. True by default.
    pageTransitionAnimation: PageTransitionAnimation.cupertino,
  );
}
