import 'package:bumble_bot/presentation/global/fonts.dart';
import 'package:bumble_bot/presentation/global/size.dart';
import 'package:flutter/material.dart';

import '../../global/colors.dart';

class Comments extends StatelessWidget {
  const Comments({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double widhtContain = sWidthFull(context) - 40;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      width: widhtContain,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: cBlack,
              borderRadius: BorderRadius.circular(100),
            ),
          ),
          SizedBox(
            width: widhtContain - 60,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Ahmad Udin Saputra Genit Banget', style: h3(cBlack)),
                const SizedBox(height: 5),
                Text(
                  'HALAH mantep banget ini coint, pokok nya gua harus beli banget banget bnagte6 wkjmelkw;jeml',
                  style: h5(cBlack),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
