import 'package:bumble_bot/presentation/global/colors.dart';
import 'package:bumble_bot/presentation/global/fonts.dart';
import 'package:flutter/material.dart';

import '../../global/size.dart';

class TokenHolder extends StatelessWidget {
  final String contacName;
  final String ticket;
  final int demical;
  final String balance;
  final String contacAddres;
  const TokenHolder({
    Key? key,
    required this.balance,
    required this.contacAddres,
    required this.contacName,
    required this.demical,
    required this.ticket,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: cPremier, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Token: ', style: h4(cPremier)),
              SizedBox(
                width: sWidthDynamic(context, 0.53) - 120,
                child: Text(
                  contacName,
                  style: h5(cBlack),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Ticker: ', style: h4(cPremier)),
              SizedBox(
                width: sWidthDynamic(context, 0.53) - 120,
                child: Text(
                  ticket,
                  style: h5(cBlack),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Decimal: ', style: h4(cPremier)),
              SizedBox(
                width: sWidthDynamic(context, 0.53) - 120,
                child: Text('$demical', style: h5(cBlack)),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Address: ', style: h4(cPremier)),
              SizedBox(
                width: sWidthDynamic(context, 0.53) - 120,
                child: Text(
                  contacAddres,
                  style: h5(cBlack),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
