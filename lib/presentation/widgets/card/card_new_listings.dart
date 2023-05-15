import 'package:bumble_bot/presentation/global/colors.dart';
import 'package:bumble_bot/presentation/global/fonts.dart';
import 'package:bumble_bot/presentation/screens/detail_coint.dart';
import 'package:bumble_bot/presentation/utils/list_reputation.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_custom/persistent-tab-view.dart';

class CardNewListing extends StatelessWidget {
  final String nameToken;
  final String reputation;
  final String walet;
  final String kyc;
  final String createDate;

  const CardNewListing({
    Key? key,
    required this.nameToken,
    required this.createDate,
    required this.kyc,
    required this.reputation,
    required this.walet,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => goNext(context),
      child: Container(
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
              alignment: Alignment.topLeft,
              width: 110,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    nameToken,
                    style: h3(cTersier),
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
                          color: convertReputation(reputation),
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
                    style: h3(cTersier),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    walet,
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
      ),
    );
  }

  goNext(BuildContext context) {
    pushNewScreen(
      context,
      screen: DetailCoint(resultScanne: walet),
      withNavBar: true, // OPTIONAL VALUE. True by default.
      pageTransitionAnimation: PageTransitionAnimation.cupertino,
    );
  }
}
