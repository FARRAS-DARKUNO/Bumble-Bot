import 'package:bumble_bot/presentation/widgets/button/back_button_add_chats.dart';
import 'package:bumble_bot/presentation/widgets/card/card_chat.dart';
import 'package:flutter/material.dart';
import '../global/size.dart';

class ListCats extends StatelessWidget {
  const ListCats({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            const BackButtonAddChats(),
            SizedBox(
              height: sHeightScreen(context) - sHeightBackButton(context),
              child: SingleChildScrollView(
                child: Column(
                  children: const [
                    CardChat(),
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
