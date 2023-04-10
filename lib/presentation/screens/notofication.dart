import 'package:flutter/material.dart';
import '../global/colors.dart';
import '../global/fonts.dart';
import '../global/size.dart';
import '../widgets/button/back_button.dart';

class NotificationBase extends StatelessWidget {
  const NotificationBase({
    Key? key,
  }) : super(key: key);

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
                    Text('Pemberitahuan', style: h3(cBlack)),
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
