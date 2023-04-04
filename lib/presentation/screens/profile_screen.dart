import 'package:bumble_bot/presentation/global/colors.dart';
import 'package:bumble_bot/presentation/global/fonts.dart';
import 'package:bumble_bot/presentation/global/size.dart';
import 'package:bumble_bot/presentation/widgets/button/edit_and_massage.dart';
import 'package:bumble_bot/presentation/widgets/button/post_story_gift.dart';
import 'package:bumble_bot/presentation/widgets/catalog/follow_and_like.dart';
import 'package:bumble_bot/presentation/widgets/catalog/sosmed.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: sHeightScreen(context),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(height: 150, color: cBlue),
                Container(
                  transform: Matrix4.translationValues(0.0, -50.0, 0.0),
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    color: cBlack,
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(color: cWhite, width: 2),
                  ),
                ),
                Text(
                  'Abdurrachman Farras Al-Haddad ',
                  style: h1(cBlack),
                  textAlign: TextAlign.center,
                ),
                Text(
                  'Abdurrachman Farras Al-Haddad ',
                  style: h4(cGray),
                  textAlign: TextAlign.center,
                ),
                const SosmedCatalog(),
                const FollowAndLike(),
                const EditAndMassage(),
                const PostSroryGift()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
