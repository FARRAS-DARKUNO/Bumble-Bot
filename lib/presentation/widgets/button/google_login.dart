import 'package:bumble_bot/presentation/global/colors.dart';
import 'package:bumble_bot/presentation/global/fonts.dart';
import 'package:bumble_bot/presentation/global/size.dart';
import 'package:bumble_bot/presentation/widgets/navigation/navigation.dart';
import 'package:flutter/cupertino.dart';

class GoogleAndLogin extends StatelessWidget {
  const GoogleAndLogin({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      width: sWidthFull(context),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          GestureDetector(
            onTap: () => gotoGoogle(context),
            child: Container(
              width: sWidthDynamic(context, 0.4),
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/google.png', scale: 9),
                  const SizedBox(width: 15),
                  Text('Google', style: h3(cPremier))
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () => gotoLogin(context),
            child: Container(
              alignment: Alignment.center,
              width: sWidthDynamic(context, 0.4),
              height: 40,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: cPremier,
                boxShadow: [
                  BoxShadow(
                    color: cGray,
                    blurRadius: 1,
                    offset: Offset(0, 1), // Shadow position
                  ),
                ],
              ),
              child: Text('Login', style: h1(cWhite)),
            ),
          )
        ],
      ),
    );
  }
}

gotoGoogle(BuildContext context) {}

gotoLogin(BuildContext context) {
  Navigator.of(context).push(CupertinoPageRoute<void>(
    title: "Click me",
    builder: (BuildContext context) => const Navigation(),
  ));
}
