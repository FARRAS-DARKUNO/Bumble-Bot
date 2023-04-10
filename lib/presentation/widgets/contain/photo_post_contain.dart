import 'package:bumble_bot/presentation/global/size.dart';
import 'package:bumble_bot/presentation/screens/detail_post.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_custom/persistent-tab-view.dart';

import '../../global/colors.dart';
import '../../global/fonts.dart';

class PhotoPostContain extends StatelessWidget {
  const PhotoPostContain({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 1.0, color: cGray),
        ),
      ),
      width: sWidthFull(context) - 40,
      child: Column(
        children: [
          profileUI(context),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            width: sWidthFull(context) - 40,
            height: 300,
            color: cBlack,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              giftUi(context),
              Row(
                children: const [
                  Icon(Icons.favorite, size: 30, color: cGray),
                  SizedBox(width: 10),
                  Icon(Icons.share, size: 30, color: cGray)
                ],
              ),
            ],
          ),
          descriptionUi(context),
        ],
      ),
    );
  }
}

Widget profileUI(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          color: cBlack,
          borderRadius: BorderRadius.circular(100),
        ),
      ),
      GestureDetector(
        onTap: () => gotoDetail(context),
        child: SizedBox(
          width: sWidthDynamic(context, 0.97) - 50 - 80 - 40,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Hera Sugara Anata Katsuyo', style: h4(cBlack)),
              Text('@era Sugara Anata Katsuyo', style: h5(cGray))
            ],
          ),
        ),
      ),
      Container(
        alignment: Alignment.center,
        height: 30,
        width: 80,
        decoration: BoxDecoration(
          color: cWhite,
          borderRadius: BorderRadius.circular(100),
          boxShadow: const [
            BoxShadow(
              color: cGray,
              blurRadius: 1,
              offset: Offset(0, 1), // Shadow position
            ),
          ],
        ),
        child: Text('Unollow', style: h4(cPremier)),
      ),
    ],
  );
}

Widget giftUi(BuildContext context) {
  return Container(
    alignment: Alignment.center,
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
    decoration: BoxDecoration(
      color: cWhite,
      borderRadius: BorderRadius.circular(100),
      boxShadow: const [
        BoxShadow(
          color: cGray,
          blurRadius: 1,
          offset: Offset(0, 1), // Shadow position
        ),
      ],
      gradient: const LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment(1, 0),
        colors: <Color>[cTersier, cPremier],
      ),
    ),
    child: Row(
      children: [
        const Icon(Icons.wallet_giftcard, color: cWhite, size: 24),
        Text(" Gift", style: h3(cWhite))
      ],
    ),
  );
}

Widget descriptionUi(BuildContext context) {
  return GestureDetector(
    onTap: () => gotoDetail(context),
    child: Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      width: sWidthFull(context) - 45,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of',
            style: h4(cBlack),
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 10),
          Text(
            '#Mantaps #Hahaia',
            style: h5(cBlue),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const Icon(Icons.pin_drop_rounded, size: 14, color: cPremier),
              SizedBox(
                width: sWidthFull(context) - 45 - 14,
                child: Text(
                  '  Jl manggis Jl, auihaohsmm, sadhom , doahs , asidm, dajkda',
                  overflow: TextOverflow.ellipsis,
                  style: h5(cGray),
                ),
              )
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const Icon(Icons.people, size: 14, color: cPremier),
              SizedBox(
                width: sWidthFull(context) - 45 - 14,
                child: Text(
                  '  Jl manggis Jl, auihaohsmm, sadhom , doahs , asidm, dajkdaefefefe',
                  overflow: TextOverflow.ellipsis,
                  style: h5(cGray),
                ),
              )
            ],
          )
        ],
      ),
    ),
  );
}

gotoDetail(BuildContext context) {
  pushNewScreen(
    context,
    screen: const DetailPost(),
    withNavBar: false,
    pageTransitionAnimation: PageTransitionAnimation.cupertino,
  );
}
