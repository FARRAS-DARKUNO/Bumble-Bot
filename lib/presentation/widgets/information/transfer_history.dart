import 'package:bumble_bot/presentation/global/fonts.dart';
import 'package:bumble_bot/presentation/utils/list_reputation.dart';
import 'package:flutter/material.dart';
import '../../global/colors.dart';
import '../../global/size.dart';

Widget transferHistoryUp(BuildContext context) {
  return Container(
    decoration: const BoxDecoration(
      border: Border(
        bottom: BorderSide(width: 1.0, color: cGray),
      ),
    ),
    width: sWidthDynamic(context, 1) - 40,
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: Column(
      children: <Widget>[
        Row(
          children: [
            Container(
              margin: const EdgeInsets.only(right: 10),
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                color: cPremier,
                borderRadius: BorderRadius.circular(100),
              ),
              child: const Icon(Icons.arrow_upward, color: cWhite),
            ),
            Container(
              alignment: Alignment.centerLeft,
              width: sWidthDynamic(context, 0.98) - 45 - 10 - 40,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Transfer', style: h3(cBlack)),
                  Text(
                    'To:mxomaiodnnocaefcneaoncoeancioaeniocniaenoicnaeiocnioaenioe',
                    style: h3(cGray),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ],
              ),
            )
          ],
        ),
        const SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text('29-01-2001', style: h5(cGray)),
            Text('0,8622 BNB', style: h2(cGood))
          ],
        )
      ],
    ),
  );
}

Widget transferHistoryDown(BuildContext context) {
  return Container(
    decoration: const BoxDecoration(
      border: Border(
        bottom: BorderSide(width: 1.0, color: cGray),
      ),
    ),
    width: sWidthDynamic(context, 1) - 40,
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: Column(
      children: <Widget>[
        Row(
          children: [
            Container(
              margin: const EdgeInsets.only(right: 10),
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                color: cPremier,
                borderRadius: BorderRadius.circular(100),
              ),
              child: const Icon(Icons.arrow_downward, color: cWhite),
            ),
            Container(
              alignment: Alignment.centerLeft,
              width: sWidthDynamic(context, 0.98) - 45 - 10 - 40,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Transfer', style: h3(cBlack)),
                  Text(
                    'To:mxomaiodnnocaefcneaoncoeancioaeniocniaenoicnaeiocnioaenioe',
                    style: h3(cGray),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ],
              ),
            )
          ],
        ),
        const SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text('29-01-2001', style: h5(cGray)),
            Text('-0,8622 BNB', style: h2(cRed))
          ],
        )
      ],
    ),
  );
}

Widget transferHistorySCC(BuildContext context) {
  return Container(
    decoration: const BoxDecoration(
      border: Border(
        bottom: BorderSide(width: 1.0, color: cGray),
      ),
    ),
    width: sWidthDynamic(context, 1) - 40,
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: Column(
      children: <Widget>[
        Row(
          children: [
            Container(
              margin: const EdgeInsets.only(right: 10),
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                color: cPremier,
                borderRadius: BorderRadius.circular(100),
              ),
              child: const Icon(Icons.article_outlined, color: cWhite),
            ),
            Container(
              alignment: Alignment.centerLeft,
              width: sWidthDynamic(context, 0.98) - 45 - 10 - 40,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Smart Contract Call', style: h3(cBlack)),
                  Text(
                    'To:mxomaiodnnocaefcneaoncoeancioaeniocniaenoicnaeiocnioaenioe',
                    style: h3(cGray),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ],
              ),
            )
          ],
        ),
        const SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text('29-01-2001', style: h5(cGray)),
            Text('-0,8622 BNB', style: h2(cRed))
          ],
        )
      ],
    ),
  );
}
