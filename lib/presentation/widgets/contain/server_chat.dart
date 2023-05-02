import 'package:bumble_bot/presentation/global/colors.dart';
import 'package:bumble_bot/presentation/global/fonts.dart';
import 'package:bumble_bot/presentation/global/size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ServerChat extends StatelessWidget {
  final String message;
  const ServerChat({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      width: sWidthFull(context),
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            constraints: BoxConstraints(maxWidth: sWidthDynamic(context, 0.7)),
            decoration: BoxDecoration(
              color: cBlue,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Container(
                //   height: 150,
                //   width: sWidthDynamic(context, 0.7) - 15 * 2,
                //   color: cBlack,
                // ),
                // const SizedBox(height: 5),
                Text(
                  message,
                  style: h4(cWhite),
                  textAlign: TextAlign.start,
                ),
              ],
            ),
          ),
          // const SizedBox(height: 5),
          // Text(
          //   '02:02:91 20-29-1992',
          //   style: h5(cGray),
          //   textAlign: TextAlign.start,
          // ),
        ],
      ),
    );
  }
}
