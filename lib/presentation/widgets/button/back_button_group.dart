import 'package:bumble_bot/presentation/global/colors.dart';
import 'package:bumble_bot/presentation/global/fonts.dart';
import 'package:bumble_bot/presentation/global/size.dart';
import 'package:bumble_bot/presentation/screens/add_to_group.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_custom/persistent-tab-view.dart';

class BackButtonGroup extends StatelessWidget {
  final String name;
  final String totalPersonil;
  final String roomid;
  const BackButtonGroup({
    Key? key,
    required this.name,
    required this.totalPersonil,
    required this.roomid,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: sHeightBackButton(context) + 20,
      width: sWidthFull(context),
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Icon(Icons.chevron_left_rounded,
                size: 24, color: cPremier),
          ),
          Container(
            padding: const EdgeInsets.only(left: 10),
            alignment: Alignment.centerLeft,
            height: sHeightBackButton(context),
            width: sWidthDynamic(context, 0.9) - 40 - 30,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: h3(cPremier)),
                const SizedBox(height: 5),
                Text("Total Member : $totalPersonil", style: h5(cGray)),
              ],
            ),
          ),
          GestureDetector(
            onTap: () => gotoAddGroup(context),
            child:
                const Icon(Icons.group_add_rounded, size: 30, color: cPremier),
          )
        ],
      ),
    );
  }

  gotoAddGroup(BuildContext context) {
    pushNewScreen(
      context,
      screen: AddToGroup(roomId: roomid),
      withNavBar: false, // OPTIONAL VALUE. True by default.
      pageTransitionAnimation: PageTransitionAnimation.cupertino,
    );
  }
}
