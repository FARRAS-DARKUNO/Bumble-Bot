import 'package:bumble_bot/presentation/global/colors.dart';
import 'package:bumble_bot/presentation/global/size.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SosmedCatalog extends StatelessWidget {
  const SosmedCatalog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: sWidthFull(context),
      alignment: Alignment.center,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: const <Widget>[
          FaIcon(FontAwesomeIcons.twitter, size: 35, color: cPremier),
          SizedBox(width: 10),
          FaIcon(FontAwesomeIcons.instagram, size: 35, color: cPremier),
          SizedBox(width: 10),
          FaIcon(FontAwesomeIcons.envelope, size: 35, color: cPremier),
          SizedBox(width: 10),
          FaIcon(FontAwesomeIcons.telegram, size: 35, color: cPremier),
        ],
      ),
    );
  }
}
