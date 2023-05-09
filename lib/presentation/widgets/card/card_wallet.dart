import 'package:bumble_bot/data/repository/wallet_repository.dart';
import 'package:bumble_bot/presentation/global/fonts.dart';
import 'package:bumble_bot/presentation/global/size.dart';
import 'package:flutter/material.dart';

import '../../global/colors.dart';

class CardWallet extends StatefulWidget {
  const CardWallet({Key? key}) : super(key: key);

  @override
  State<CardWallet> createState() => _CardWalletState();
}

class _CardWalletState extends State<CardWallet> {
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
      alignment: Alignment.center,
      width: sWidthFull(context) - 40,
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        gradient: const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment(1, 0),
          colors: <Color>[cTersier, cPremier],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('Bumble', style: h1(cWhite)),
              Text('Balance', style: h3(cGray)),
            ],
          ),
          const SizedBox(height: 10),
          Text('$bumble \$Bumble', style: h1(cWhite)),
          const SizedBox(height: 10),
          Text('BNB', style: h1(cWhite)),
          const SizedBox(height: 10),
          Text('$bnb \$BNB', style: h1(cWhite)),
        ],
      ),
    );
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
