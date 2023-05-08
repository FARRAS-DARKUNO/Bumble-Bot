import 'package:bumble_bot/data/model/list_token_model.dart';
import 'package:bumble_bot/data/repository/wallet_repository.dart';
import 'package:bumble_bot/presentation/global/colors.dart';
import 'package:bumble_bot/presentation/global/fonts.dart';
import 'package:bumble_bot/presentation/global/size.dart';
import 'package:bumble_bot/presentation/screens/more_listing.dart';
import 'package:bumble_bot/presentation/widgets/box_input/search_walet_screening.dart';
import 'package:bumble_bot/presentation/widgets/card/card_new_listings.dart';
import 'package:bumble_bot/presentation/widgets/catalog/vote_and_project.dart';
import 'package:bumble_bot/presentation/widgets/information/reputation.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_custom/persistent-tab-view.dart';

class ScreeningScreen extends StatefulWidget {
  const ScreeningScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ScreeningScreen> createState() => _ScreeningScreenState();
}

class _ScreeningScreenState extends State<ScreeningScreen> {
  final search = TextEditingController();
  ListTokenModel? listToken;
  bool isLoading = true;

  getListToken() async {
    await WalletRepository().getListToken().then((value) {
      setState(() {
        listToken = value;
        isLoading = false;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getListToken();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: SizedBox(
            height: sHeightScreen(context),
            child: ListView(
              children: <Widget>[
                Container(
                  width: sWidthFull(context),
                  height: 200,
                  color: cSekunder,
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Wallet Screening", style: h1(cWhite)),
                      const VoteAndProjectCatalog(),
                    ],
                  ),
                ),
                const ReputationInformation(),
                SearchWaletScreening(text: search),
                Container(
                  padding: const EdgeInsets.all(20),
                  width: sWidthFull(context),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('New Listings', style: h3(cBlack)),
                          GestureDetector(
                              onTap: () => gotoMore(context),
                              child: Text('More', style: h3(cPremier))),
                        ],
                      ),
                      const SizedBox(height: 10),
                      isLoading
                          ? const Center(child: CircularProgressIndicator())
                          : Column(
                              children: listToken!.data.map((value) {
                                return CardNewListing(
                                  nameToken: value.nametoken,
                                  createDate: value.creation_date,
                                  kyc: value.kyc,
                                  reputation: value.reputation,
                                  walet: value.wallet,
                                );
                              }).toList(),
                            )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  gotoMore(BuildContext context) {
    pushNewScreen(
      context,
      screen: const MoreListing(),
      withNavBar: true, // OPTIONAL VALUE. True by default.
      pageTransitionAnimation: PageTransitionAnimation.cupertino,
    );
  }
}
