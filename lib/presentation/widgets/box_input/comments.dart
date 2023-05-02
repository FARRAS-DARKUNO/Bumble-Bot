import 'package:bumble_bot/data/repository/profile_repository.dart';
import 'package:bumble_bot/presentation/global/colors.dart';
import 'package:bumble_bot/presentation/global/size.dart';
import 'package:flutter/material.dart';

import '../../../data/model/profile_model.dart';

class CommentsInput extends StatefulWidget {
  final VoidCallback action;
  final TextEditingController controller;
  const CommentsInput({
    Key? key,
    required this.action,
    required this.controller,
  }) : super(key: key);

  @override
  State<CommentsInput> createState() => _CommentsInputState();
}

class _CommentsInputState extends State<CommentsInput> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: sHeightInputComments(context),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            width: sWidthDynamic(context, 0.8) - 22,
            margin: const EdgeInsets.only(left: 20),
            padding: const EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              border: Border.all(width: 1, color: cPremier),
            ),
            child: TextField(
              controller: widget.controller,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Search Wallet',
              ),
            ),
          ),
          GestureDetector(
            onTap: () => widget.action(),
            child: Container(
              width: sWidthDynamic(context, 0.2) - 22,
              height: sHeightBackButton(context),
              margin: const EdgeInsets.only(right: 20),
              decoration: BoxDecoration(
                color: cTersier,
                borderRadius: BorderRadius.circular(40),
                border: Border.all(width: 1, color: cGray),
                // color: cWhite,
              ),
              child: const Icon(Icons.send, color: cWhite),
            ),
          ),
        ],
      ),
    );
  }
}
