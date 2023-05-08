import 'package:bumble_bot/data/repository/wallet_repository.dart';
import 'package:bumble_bot/presentation/global/colors.dart';
import 'package:bumble_bot/presentation/global/fonts.dart';
import 'package:bumble_bot/presentation/global/size.dart';
import 'package:bumble_bot/presentation/widgets/button/back_button.dart';
import 'package:bumble_bot/presentation/widgets/catalog/vote_and_unverivied.dart';
import 'package:bumble_bot/presentation/widgets/table/token_holder.dart';
import 'package:bumble_bot/presentation/widgets/table/walet_owner.dart';
import 'package:flutter/material.dart';

class DetailCoint extends StatefulWidget {
  final String resultScanne;
  const DetailCoint({Key? key, required this.resultScanne}) : super(key: key);

  @override
  State<DetailCoint> createState() => _DetailCointState();
}

class _DetailCointState extends State<DetailCoint> {
  dynamic data;
  bool isLoading = true;
  List tokenData = [];

  getData() async {
    WalletRepository().getDetailToken(widget.resultScanne).then((value) {
      setState(() {
        data = value;
        isLoading = false;
        tokenData = data['tokens'] ?? [];
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            const BackButtonCustome(),
            SizedBox(
                height: sHeightScreen(context) - sHeightBackButton(context),
                child: isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : data['message'] == 'success'
                        ? ListView(
                            children: [
                              Container(
                                width: sWidthFull(context),
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text('Wallet Owner',
                                        style: semiTitle(cBlack)),
                                    WaletOwner(
                                      project: data['name'],
                                      wallet: data['owner'],
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(height: 20),
                              GridView.count(
                                  crossAxisCount: 2,
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  crossAxisSpacing: 3,
                                  mainAxisSpacing: 3,
                                  scrollDirection: Axis.vertical,
                                  physics:
                                      const NeverScrollableScrollPhysics(), // arah scroll
                                  shrinkWrap: true, // jumlah kolom
                                  children: tokenData.map((value) {
                                    return TokenHolder(
                                      balance: value["balance"],
                                      contacAddres: value["contract_address"],
                                      contacName: value["contract_name"],
                                      demical: value["contract_decimals"],
                                      ticket: value["contract_ticker_symbol"],
                                    );
                                  }).toList()),
                              const SizedBox(height: 10),
                              const Padding(
                                padding: EdgeInsets.all(20),
                                child: VoteAndUnveriviedCatalog(),
                              )
                            ],
                          )
                        : Center(
                            child: Text(
                            'Alamat \n\n${widget.resultScanne}\n\nTidak Ditemukan',
                            style: h3(cPremier),
                            textAlign: TextAlign.center,
                          ))),
          ],
        ),
      ),
    );
  }
}
