import 'package:bumble_bot/presentation/global/fonts.dart';
import 'package:flutter/material.dart';

import '../../global/colors.dart';
import '../../global/size.dart';

class AddLocationOnPosting extends StatelessWidget {
  const AddLocationOnPosting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: sWidthDynamic(context, 1) - 40,
        height: 50,
        padding: const EdgeInsets.only(left: 10, right: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          border: Border.all(width: 2, color: cPremier),
        ),
        child: Row(
          children: <Widget>[
            SizedBox(
              width: sWidthDynamic(context, 0.20) - 30,
              child: const Icon(Icons.location_on, color: cTersier, size: 30),
            ),
            SizedBox(
              width: sWidthDynamic(context, 0.78) - 30,
              child: Text(
                'Location',
                style: h4(cGray),
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ));
  }
}
