import 'package:bumble_bot/data/repository/wallet_repository.dart';
import 'package:flutter/material.dart';
import '../../data/model/list_token_model.dart';
import '../global/size.dart';
import '../widgets/button/back_button.dart';
import '../widgets/card/card_new_listings.dart';

class MoreListing extends StatefulWidget {
  const MoreListing({
    Key? key,
  }) : super(key: key);

  @override
  State<MoreListing> createState() => _MoreListingState();
}

class _MoreListingState extends State<MoreListing> {
  bool isLoading = true;
  ListTokenModel? listToken;

  @override
  void initState() {
    super.initState();
    getListToken();
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
                child: isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: listToken!.data.map((value) {
                            return CardNewListing(
                              nameToken: value.nametoken,
                              createDate: value.creation_date,
                              kyc: value.kyc,
                              reputation: value.reputation,
                              walet: value.wallet,
                            );
                          }).toList(),
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  getListToken() async {
    await WalletRepository().getListTokenMore().then((value) {
      setState(() {
        listToken = value;
        isLoading = false;
      });
    });
  }
}
