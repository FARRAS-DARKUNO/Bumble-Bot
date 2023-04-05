import 'package:bumble_bot/presentation/global/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../global/colors.dart';
import '../../global/size.dart';

class AmountDropdown extends StatefulWidget {
  final String hintText;
  const AmountDropdown({Key? key, required this.hintText}) : super(key: key);

  @override
  State<AmountDropdown> createState() => _AmountDropdownState();
}

class _AmountDropdownState extends State<AmountDropdown> {
  List<String> list = <String>['BNB', 'BUMBLE'];
  String dropdownValue = 'BNB';
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
              // inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              keyboardType: TextInputType.number,
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
