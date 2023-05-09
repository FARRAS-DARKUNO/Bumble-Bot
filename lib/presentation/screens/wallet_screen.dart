import 'package:bumble_bot/data/repository/gift_repository.dart';
import 'package:bumble_bot/presentation/global/colors.dart';
import 'package:bumble_bot/presentation/global/fonts.dart';
import 'package:bumble_bot/presentation/widgets/alert/alert_dynamic.dart';
import 'package:bumble_bot/presentation/widgets/button/button_on_wallet.dart';
import 'package:bumble_bot/presentation/widgets/card/card_wallet.dart';
import 'package:bumble_bot/presentation/widgets/navigation/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:persistent_bottom_nav_bar_custom/persistent-tab-view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../global/size.dart';
import '../widgets/box_input/amount_dropdown.dart';
import '../widgets/box_input/password.dart';
import '../widgets/box_input/text_normal_input.dart';
import '../widgets/button/normal_button.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  final username = TextEditingController();
  final password = TextEditingController();
  final amount = TextEditingController();
  final drowdown = TextEditingController();
  String walletToken = '';
  String provateKey = '';
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    getTokenWalet();
    getPrivateKey();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: SizedBox(
            height: sHeightScreen(context),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  waletUi(context, walletToken),
                  const CardWallet(),
                  const ButtonOnWallet(),
                  const SizedBox(height: 10),
                  Text('Gift Token', style: h1(cPremier)),
                  const SizedBox(height: 10),
                  const SizedBox(height: 10),
                  TextNormalInput(hintText: 'To Username', text: username),
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
          ),
        ),
      ),
    );
  }

  Widget waletUi(BuildContext context, String tokenWallet) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text('Wallet', style: h1(cBlack)),
          Container(
            width: sWidthDynamic(context, 0.65),
            height: 35,
            padding: const EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              border: Border.all(width: 2, color: cGray),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(
                  width: sWidthDynamic(context, 0.64) - 24 - 30,
                  child: Text(
                    tokenWallet,
                    style: h5(cGray),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                GestureDetector(
                  onTap: () => onCopy(context, tokenWallet),
                  child: const Icon(
                    Icons.copy,
                    color: cTersier,
                    size: 24,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  onCopy(BuildContext context, String text) async {
    await Clipboard.setData(ClipboardData(text: text)).then((_) {
      alertDynamic(context, 'Copy', 'Copy Wallet Address : \n\n$text');
    });
  }

  getTokenWalet() async {
    final pref = await SharedPreferences.getInstance();
    var wallet = pref.getString('Wallet') ?? '';
    setState(() {
      walletToken = wallet;
    });
  }

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
        GiftReposotory()
            .postGiftCoint(provateKey, username.value.text, amount.value.text)
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
        GiftReposotory()
            .postGiftToken(provateKey, username.value.text, amount.value.text)
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
