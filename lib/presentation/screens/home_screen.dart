import 'package:bumble_bot/presentation/global/colors.dart';
import 'package:bumble_bot/presentation/global/fonts.dart';
import 'package:bumble_bot/presentation/global/size.dart';
import 'package:bumble_bot/presentation/widgets/card/card_profile_notification.dart';
import 'package:bumble_bot/presentation/widgets/contain/slide_post.dart';
import 'package:flutter/material.dart';

import '../widgets/contain/carousel_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: sHeightScreen(context),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                const CardProfileNotification(),
                const SlidePost(),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Become a', style: h4(cBlack)),
                          Text('Contain Creator', style: h1(cBlack)),
                        ],
                      ),
                    ],
                  ),
                ),
                const CorouselSLider(),
                Container(
                    margin: const EdgeInsets.only(left: 20, top: 20),
                    alignment: Alignment.topLeft,
                    child: Text('Lates News', style: h4(cGray)))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
