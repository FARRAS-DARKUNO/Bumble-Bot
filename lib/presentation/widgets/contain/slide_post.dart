import 'package:bumble_bot/presentation/widgets/card/card_add_post.dart';
import 'package:bumble_bot/presentation/widgets/card/card_post_circle.dart';
import 'package:flutter/material.dart';

class SlidePost extends StatelessWidget {
  const SlidePost({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const <Widget>[
          CardAddPost(),
          CardPostCircle(),
          CardPostCircle(),
          CardPostCircle(),
          CardPostCircle(),
          CardPostCircle(),
          CardPostCircle(),
          CardPostCircle(),
          CardPostCircle(),
        ],
      ),
    );
  }
}
