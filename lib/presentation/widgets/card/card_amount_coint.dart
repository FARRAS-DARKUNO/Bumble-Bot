import 'package:bumble_bot/presentation/global/fonts.dart';
import 'package:flutter/material.dart';

import '../../../data/repository/wallet_repository.dart';
import '../../global/colors.dart';
import '../../global/size.dart';

class CardAmountCoint extends StatefulWidget {
  const CardAmountCoint({Key? key}) : super(key: key);

  @override
  State<CardAmountCoint> createState() => _CardAmountCointState();
}

class _CardAmountCointState extends State<CardAmountCoint> {
  double bnb = 0;
  double bumble = 0;

  @override
  void initState() {
    super.initState();
    getBnb();
    getBumble();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: sWidthDynamic(context, 1) - 40,
        padding: const EdgeInsets.only(left: 10, right: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(width: 2, color: cPremier),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Column(
                children: [
                  Text('$bnb', style: h1(cPremier)),
                  Text('BNB', style: h4(cPremier)),
                ],
              ),
              Column(
                children: [
                  Text('$bumble', style: h1(cPremier)),
                  Text('BUMBLE', style: h4(cPremier)),
                ],
              )
            ],
          ),
        ));
  }

  getBnb() async {
    WalletRepository().getCointBalance().then((value) {
      setState(() {
        bnb = value.account;
      });
    });
  }

  getBumble() async {
    WalletRepository().getTokenBalance().then((value) {
      setState(() {
        bumble = value.amount;
      });
    });
  }
}
