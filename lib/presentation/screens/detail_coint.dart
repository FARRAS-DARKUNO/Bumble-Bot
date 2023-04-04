import 'package:bumble_bot/presentation/global/colors.dart';
import 'package:bumble_bot/presentation/global/fonts.dart';
import 'package:bumble_bot/presentation/global/size.dart';
import 'package:bumble_bot/presentation/widgets/button/back_button.dart';
import 'package:bumble_bot/presentation/widgets/catalog/vote_and_unverivied.dart';
import 'package:bumble_bot/presentation/widgets/table/token_deployed.dart';
import 'package:bumble_bot/presentation/widgets/table/token_holder.dart';
import 'package:bumble_bot/presentation/widgets/table/walet_owner.dart';
import 'package:flutter/material.dart';

class DetailCoint extends StatelessWidget {
  const DetailCoint({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            const BackButtonCustome(),
            SizedBox(
              height: sHeightScreen(context) - sHeightBackButton(context),
              child: ListView(
                children: [
                  Container(
                    width: sWidthFull(context),
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Wallet Owner', style: semiTitle(cBlack)),
                        const WaletOwner()
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        margin: const EdgeInsets.only(left: 20),
                        width: sWidthDynamic(context, 0.5) - 22,
                        child: const TokenHolder(),
                      ),
                      Container(
                        margin: const EdgeInsets.only(right: 20),
                        width: sWidthDynamic(context, 0.5) - 22,
                        child: const TokenDeployed(),
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Padding(
                    padding: EdgeInsets.all(20),
                    child: VoteAndUnveriviedCatalog(),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
