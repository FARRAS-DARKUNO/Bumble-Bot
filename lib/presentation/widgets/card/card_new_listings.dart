import 'package:bumble_bot/presentation/global/colors.dart';
import 'package:bumble_bot/presentation/global/fonts.dart';
import 'package:bumble_bot/presentation/utils/list_reputation.dart';
import 'package:flutter/material.dart';

class CardNewListing extends StatelessWidget {
  const CardNewListing({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1.0,
            color: cPremier,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            height: 50,
            width: 50,
            color: cBlack,
          ),
          Container(
            alignment: Alignment.topLeft,
            width: 110,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'BumbleCoint',
                  style: h3(cBlack),
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text('Reputation', style: h5(cGray)),
                    const SizedBox(width: 5),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: cGood,
                      ),
                      height: 12,
                      width: 12,
                    )
                  ],
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            width: 155,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Developer Contract',
                  style: h3(cBlack),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  'bbcbiabibcUWVudaqdadw3adawddviad',
                  style: h5(cGray),
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ),
          ),
          const Icon(
            Icons.chevron_right_rounded,
            color: cPremier,
            size: 30,
          )
        ],
      ),
    );
  }
}
