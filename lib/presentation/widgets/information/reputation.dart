import 'package:bumble_bot/presentation/global/colors.dart';
import 'package:bumble_bot/presentation/global/fonts.dart';
import 'package:bumble_bot/presentation/global/size.dart';
import 'package:bumble_bot/presentation/utils/list_reputation.dart';
import 'package:flutter/material.dart';

class ReputationInformation extends StatelessWidget {
  const ReputationInformation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Reputation', style: semiTitle(cBlack)),
          const SizedBox(height: 10),
          SizedBox(
            width: sWidthFull(context),
            child: Wrap(
                spacing: 8.0, // gap between adjacent chips
                runSpacing: 4.0, // gap between lines
                children: listReputation.map((value) {
                  return SizedBox(
                    width: (value['name'].toString().length * 7) + 30,
                    child: Row(
                      children: <Widget>[
                        Text('${value['name']}', style: h5(cBlack)),
                        const SizedBox(width: 5),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: value['color'],
                          ),
                          height: 12,
                          width: 12,
                        )
                      ],
                    ),
                  );
                }).toList()),
          )
        ],
      ),
    );
  }
}
