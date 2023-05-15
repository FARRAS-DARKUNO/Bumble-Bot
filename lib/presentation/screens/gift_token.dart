import 'package:bumble_bot/presentation/global/colors.dart';
import 'package:bumble_bot/presentation/global/fonts.dart';
import 'package:bumble_bot/presentation/widgets/box_input/amount_dropdown.dart';
import 'package:bumble_bot/presentation/widgets/box_input/text_normal_input.dart';
import 'package:bumble_bot/presentation/widgets/button/normal_button.dart';
import 'package:bumble_bot/presentation/widgets/card/card_amount_coint.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_custom/persistent-tab-view.dart';
import '../../data/repository/gift_repository.dart';
import '../../data/repository/wallet_repository.dart';
import '../global/size.dart';
import '../widgets/alert/alert_dynamic.dart';
import '../widgets/button/back_button.dart';
import '../widgets/navigation/navigation.dart';

class GiftToken extends StatefulWidget {
  final String giftTo;
  const GiftToken({Key? key, required this.giftTo}) : super(key: key);

  @override
  State<GiftToken> createState() => _GiftTokenState();
}

class _GiftTokenState extends State<GiftToken> {
  final username = TextEditingController();
  // TextEditingController? username;
  final amount = TextEditingController();
  final password = TextEditingController();
  final drowdown = TextEditingController();
  bool isLoading = false;

  String provateKey = '';

  @override
  void initState() {
    super.initState();
    username.text = widget.giftTo;
    getPrivateKey();
  }

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: Column(
              children: <Widget>[
                const BackButtonCustome(),
                SizedBox(
                  height: sHeightScreen(context) - sHeightBackButton(context),
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      Text('Gift Token', style: h1(cPremier)),
                      const SizedBox(height: 30),
                      const CardAmountCoint(),
                      const SizedBox(height: 10),
                      TextNormalInput(hintText: 'To Wallet', text: username),
                      const SizedBox(height: 10),
                      AmountDropdown(
                        hintText: 'Amount',
                        text: amount,
                        dropdown: drowdown,
                      ),
                      const SizedBox(height: 10),
                      // PasswordInput(hintText: 'Password', text: password),
                      const SizedBox(height: 30),
                      GestureDetector(
                        onTap: () => postGiftToken(),
                        child: NormalButton(
                            title: isLoading ? "Loading..." : 'Submit'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );

  getPrivateKey() async {
    GiftReposotory().getPrivateKey().then((value) {
      setState(() {
        provateKey = value.data.private_key;
      });
    });
  }

  postGiftToken() async {
    if (!isLoading) {
      setState(() {
        isLoading = true;
      });
      if (drowdown.value.text == '' || drowdown.value.text == 'BNB') {
        await WalletRepository().getCointBalance().then((value) async {
          if (value.account > 0) {
            await GiftReposotory()
                .postGiftCoint(
                    provateKey, username.value.text, amount.value.text)
                .then(
              (value) {
                if (value.message == 'success') {
                  gotoBack(context);
                  alertDynamic(context, value.message, 'Berhasil Terkirim');
                } else {
                  setState(() {
                    isLoading = false;
                  });
                  alertDynamic(context, 'Terjadi Kesalahan',
                      'Periksa kembali data atau jaringan anda');
                }
              },
            );
          } else {
            setState(() {
              isLoading = false;
            });
            alertDynamic(context, 'Terjadi Kesalahan',
                'periksa kembali nominal koin anda');
          }
        });
      } else {
        await WalletRepository().getTokenBalance().then((value) {
          if (value.amount > 0) {
            GiftReposotory()
                .postGiftToken(
                    provateKey, username.value.text, amount.value.text)
                .then(
              (value) {
                if (value.message == 'success') {
                  gotoBack(context);
                  alertDynamic(context, value.message, 'Berhasil Terkirim');
                } else {
                  setState(() {
                    isLoading = false;
                  });
                  alertDynamic(context, 'Terjadi Kesalahan',
                      'Periksa kembali data atau jaringan anda');
                }
              },
            );
          } else {
            setState(() {
              isLoading = false;
            });
            alertDynamic(context, 'Terjadi Kesalahan',
                'periksa kembali nominal token anda');
          }
        });
      }
    }
  }

  gotoBack(BuildContext context) {
    pushNewScreen(
      context,
      screen: const Navigation(),
      withNavBar: false, // OPTIONAL VALUE. True by default.
      pageTransitionAnimation: PageTransitionAnimation.cupertino,
    );
  }
}
