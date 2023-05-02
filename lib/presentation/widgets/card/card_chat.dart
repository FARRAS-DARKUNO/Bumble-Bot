import 'package:bumble_bot/presentation/global/fonts.dart';
import 'package:bumble_bot/presentation/screens/chat.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_custom/persistent-tab-view.dart';

import '../../global/colors.dart';
import '../../global/size.dart';

class CardChat extends StatelessWidget {
  final String id;
  final String name;
  final String type;
  final String creator;
  final String createdAt;
  const CardChat({
    Key? key,
    required this.id,
    required this.createdAt,
    required this.creator,
    required this.name,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => gotoChat(context, id),
      child: Card(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          width: sWidthFull(context),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                alignment: Alignment.centerLeft,
                width: sWidthDynamic(context, 0.55),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(name, style: h3(cBlack)),
                    Text(
                      type,
                      style: h5(cGray),
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),
              // SizedBox(
              //   width: sWidthDynamic(context, 0.2),
              //   child: Column(
              //     children: <Widget>[
              //       Text(
              //         '27/09/1002',
              //         style: h5(cGray),
              //         overflow: TextOverflow.ellipsis,
              //       ),
              //     ],
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}

gotoChat(BuildContext context, String id) {
  pushNewScreen(
    context,
    screen: Chat(roomId: id),
    withNavBar: false, // OPTIONAL VALUE. True by default.
    pageTransitionAnimation: PageTransitionAnimation.cupertino,
  );
}
