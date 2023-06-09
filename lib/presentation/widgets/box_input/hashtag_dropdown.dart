import 'package:bumble_bot/presentation/global/fonts.dart';
import 'package:flutter/material.dart';

import '../../global/colors.dart';
import '../../global/size.dart';

class HashtagDropdown extends StatefulWidget {
  final TextEditingController text;
  final String hintText;
  const HashtagDropdown({
    Key? key,
    required this.hintText,
    required this.text,
  }) : super(key: key);

  @override
  State<HashtagDropdown> createState() => _HashtagDropdownState();
}

class _HashtagDropdownState extends State<HashtagDropdown> {
  List<String> list = <String>['FEED', 'ARTICLE'];
  String dropdownValue = 'FEED';
  @override
  Widget build(BuildContext context) {
    return Container(
      width: sWidthDynamic(context, 1) - 40,
      padding: const EdgeInsets.only(left: 10, right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        border: Border.all(width: 2, color: cPremier),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: sWidthDynamic(context, 0.58),
            child: TextField(
              controller: widget.text,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: widget.hintText,
              ),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            width: sWidthDynamic(context, 0.25),
            child: DropdownButton<String>(
              underline: Container(),
              value: dropdownValue,
              icon: const Icon(Icons.keyboard_arrow_down_rounded),
              elevation: 16,
              style: h3(cBlack),
              onChanged: (String? value) {
                // This is called when the user selects an item.
                setState(() {
                  dropdownValue = value!;
                });
              },
              items: list.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
