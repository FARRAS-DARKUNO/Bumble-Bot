import 'package:bumble_bot/presentation/global/colors.dart';
import 'package:bumble_bot/presentation/global/fonts.dart';
import 'package:bumble_bot/presentation/global/size.dart';
import 'package:flutter/material.dart';

import '../../../data/api/base_url.dart';

class ServerGroup extends StatelessWidget {
  final String photoProfile;
  final String username;
  final String message;
  const ServerGroup({
    Key? key,
    required this.message,
    required this.photoProfile,
    required this.username,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      width: sWidthFull(context),
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          photoProfile != ''
              ? CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage("$imageUrl$photoProfile"),
                )
              : const CircleAvatar(radius: 20),
          const SizedBox(width: 5),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                username,
                style: h5(cGray),
                textAlign: TextAlign.start,
              ),
              const SizedBox(height: 5),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                constraints:
                    BoxConstraints(maxWidth: sWidthDynamic(context, 0.7)),
                decoration: BoxDecoration(
                  color: cBlue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      message,
                      style: h4(cWhite),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
