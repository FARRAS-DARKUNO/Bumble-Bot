import 'package:bumble_bot/presentation/global/colors.dart';
import 'package:bumble_bot/presentation/global/fonts.dart';
import 'package:chat_bubbles/bubbles/bubble_special_one.dart';
import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:flutter/material.dart';

class UserChat extends StatelessWidget {
  final String message;

  const UserChat({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onLongPress: () async {
      //   await Clipboard.setData(ClipboardData(text: message))
      //       .then((value) => alertDynamic(context, "Copy", ''));
      // },
      child: Container(
        margin: const EdgeInsets.only(bottom: 5),
        child: BubbleSpecialOne(
          text: message,
          isSender: true,
          color: cBlue,
          textStyle: h4(cWhite),
        ),
      ),
    );
  }
}
