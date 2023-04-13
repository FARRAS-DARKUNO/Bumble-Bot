import 'package:bumble_bot/presentation/global/fonts.dart';
import 'package:bumble_bot/presentation/screens/chat.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_custom/persistent-tab-view.dart';

import '../../global/colors.dart';
import '../../global/size.dart';

class CardChat extends StatelessWidget {
  const CardChat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => gotoChat(context),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        width: sWidthFull(context),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const CircleAvatar(backgroundColor: cBlack),
            Container(
              alignment: Alignment.centerLeft,
              width: sWidthDynamic(context, 0.55),
              child: Column(children: <Widget>[
                Text('Isba Bitcoint', style: h3(cBlack)),
                Text(
                  'Halloooo semua',
                  style: h5(cGray),
                  overflow: TextOverflow.ellipsis,
                ),
              ]),
            ),
            SizedBox(
              width: sWidthDynamic(context, 0.2),
              child: Column(
                children: <Widget>[
                  Text(
                    '27/09/1002',
                    style: h5(cGray),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

gotoChat(BuildContext context) {
  pushNewScreen(
    context,
    screen: const Chat(),
    withNavBar: false, // OPTIONAL VALUE. True by default.
    pageTransitionAnimation: PageTransitionAnimation.cupertino,
  );
}
