import 'package:bumble_bot/data/repository/wallet_repository.dart';
import 'package:bumble_bot/presentation/widgets/card/card_profile_notification.dart';
import 'package:bumble_bot/presentation/widgets/information/transfer_history.dart';
import 'package:flutter/material.dart';
import '../global/colors.dart';
import '../global/fonts.dart';
import '../global/size.dart';
import '../widgets/button/back_button.dart';

class HistoryWallet extends StatefulWidget {
  const HistoryWallet({
    Key? key,
  }) : super(key: key);

  @override
  State<HistoryWallet> createState() => _HistoryWalletState();
}

class _HistoryWalletState extends State<HistoryWallet> {
  List<dynamic> data = [];

  getHistory() async {
    WalletRepository().getHistory().then((value) {
      var tempVar = [];

      for (var element in value) {
        tempVar += element['transfers'];
      }

      setState(() {
        data = tempVar;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getHistory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            const BackButtonCustome(),
            SizedBox(
              height: sHeightScreen(context) - sHeightBackButton(context),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const CardProfileNotification(),
                    Text('Transaktion History', style: h3(cBlack)),
                    Column(
                        children: data.map((value) {
                      if (value['transfer_type'] == 'OUT') {
                        return transferHistoryUp(
                          context,
                          value['delta'],
                          value['block_signed_at'],
                          value['to_address'],
                          value['contract_ticker_symbol'],
                        );
                      } else {
                        return transferHistoryDown(
                          context,
                          value['delta'],
                          value['block_signed_at'],
                          value['from_address'],
                          value['contract_ticker_symbol'],
                        );
                      }
                    }).toList())
                    // transferHistoryUp(context),
                    // transferHistoryDown(context),
                    // transferHistorySCC(context),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget buttonUI(BuildContext context) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 10),
    width: sWidthFull(context),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        GestureDetector(
          child: Container(
            alignment: Alignment.center,
            width: sWidthDynamic(context, 0.3),
            height: 40,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: cWhite,
              boxShadow: [
                BoxShadow(
                  color: cGray,
                  blurRadius: 1,
                  offset: Offset(0, 1), // Shadow position
                ),
              ],
            ),
            child: Text('Deposit', style: h3(cTersier)),
          ),
        ),
        const SizedBox(width: 10),
        GestureDetector(
          child: Container(
            alignment: Alignment.center,
            width: sWidthDynamic(context, 0.3),
            height: 40,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: cWhite,
              boxShadow: [
                BoxShadow(
                  color: cGray,
                  blurRadius: 1,
                  offset: Offset(0, 1), // Shadow position
                ),
              ],
            ),
            child: Text('Withdraw', style: h3(cYellow)),
          ),
        ),
      ],
    ),
  );
}
