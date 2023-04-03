import 'package:bumble_bot/presentation/global/colors.dart';
import 'package:bumble_bot/presentation/global/fonts.dart';
import 'package:bumble_bot/presentation/global/size.dart';
import 'package:flutter/material.dart';

class VoteAndProjectCatalog extends StatelessWidget {
  const VoteAndProjectCatalog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: sWidthFull(context),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment(1, 0),
          colors: <Color>[cTersier, cPremier],
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(15),
            width: sWidthDynamic(context, 0.5) - 30,
            alignment: Alignment.center,
            child: Row(
              children: <Widget>[
                const Icon(
                  Icons.thumb_up_alt_outlined,
                  size: 35,
                  color: cWhite,
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('20000', style: h3(cWhite)),
                    Text(
                      'Toatal Votes',
                      style: h5(cWhite),
                    )
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(15),
            width: sWidthDynamic(context, 0.5) - 30,
            alignment: Alignment.center,
            child: Row(
              children: <Widget>[
                const Icon(
                  Icons.list_alt_sharp,
                  size: 35,
                  color: cWhite,
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('150', style: h3(cWhite)),
                    Text(
                      'Project Listed',
                      style: h5(cWhite),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
