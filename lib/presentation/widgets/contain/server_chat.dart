import 'package:bumble_bot/presentation/global/colors.dart';
import 'package:bumble_bot/presentation/global/fonts.dart';
import 'package:chat_bubbles/bubbles/bubble_special_one.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ServerChat extends StatelessWidget {
  final String message;
  const ServerChat({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 5),
      child: GestureDetector(
        // onLongPress: () async {
        //   await Clipboard.setData(ClipboardData(text: message))
        //       .then((value) => alertDynamic(context, "Copy", ''));
        // },
        child: BubbleSpecialOne(
          text: message,
          isSender: false,
          color: cYellow,
          textStyle: h4(cBlack),
        ),
      ),
    );
  }
}
