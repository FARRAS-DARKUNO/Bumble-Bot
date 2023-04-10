import 'package:bumble_bot/presentation/global/colors.dart';
import 'package:bumble_bot/presentation/global/fonts.dart';
import 'package:bumble_bot/presentation/global/size.dart';
import 'package:bumble_bot/presentation/screens/posting.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_custom/persistent-tab-view.dart';

import '../widgets/contain/photo_post_contain.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: SizedBox(
            height: sHeightScreen(context),
            width: sWidthFull(context),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('Post', style: h1(cPremier)),
                        Row(
                          children: <Widget>[
                            GestureDetector(
                              onTap: () => gotoPosting(context),
                              child: const Icon(Icons.add_circle_rounded,
                                  color: cRed, size: 30),
                            ),
                            SizedBox(width: 20),
                            Icon(Icons.message, color: cPremier, size: 30),
                            SizedBox(width: 20),
                            Icon(Icons.notifications, color: cPremier, size: 30)
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: sWidthFull(context) - 40,
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      border: Border.all(width: 1, color: cPremier),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.search,
                          color: cPremier,
                          size: 30,
                        ),
                        const SizedBox(width: 5),
                        SizedBox(
                          width: sWidthDynamic(context, 0.8) - 40 - 5,
                          child: const TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Search ...',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Column(
                    children: const <Widget>[
                      PhotoPostContain(),
                      PhotoPostContain(),
                      PhotoPostContain(),
                      PhotoPostContain(),
                      SizedBox(height: 50)
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

gotoPosting(BuildContext context) {
  pushNewScreen(
    context,
    screen: const Posting(),
    withNavBar: true, // OPTIONAL VALUE. True by default.
    pageTransitionAnimation: PageTransitionAnimation.cupertino,
  );
}
