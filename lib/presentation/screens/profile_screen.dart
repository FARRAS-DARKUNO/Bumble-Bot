import 'package:bumble_bot/data/api/base_url.dart';
import 'package:bumble_bot/data/model/detail_user_model.dart';
import 'package:bumble_bot/presentation/global/colors.dart';
import 'package:bumble_bot/presentation/global/fonts.dart';
import 'package:bumble_bot/presentation/global/size.dart';
import 'package:bumble_bot/presentation/screens/login.dart';
import 'package:bumble_bot/presentation/widgets/button/edit_and_massage.dart';
import 'package:bumble_bot/presentation/widgets/button/post_story_gift.dart';
import 'package:bumble_bot/presentation/widgets/catalog/follow_and_like.dart';
import 'package:bumble_bot/presentation/widgets/catalog/sosmed.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:persistent_bottom_nav_bar_custom/persistent-tab-view.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/repository/profile_repository.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isLoading = true;
  late DetailUserModel profileData;
  getProfile(context) async {
    final pref = await SharedPreferences.getInstance();
    var username = pref.getString('Username') ?? '';
    await ProfileRepository().getUserDataRepo(username).then((value) {
      setState(() {
        profileData = value;
        isLoading = false;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getProfile(context);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: cPremier,
    ));
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SizedBox(
          height: sHeightScreen(context),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  alignment: Alignment.topRight,
                  width: sWidthFull(context),
                  padding: const EdgeInsets.all(20),
                  height: 150,
                  color: cBlue,
                  child: GestureDetector(
                    onTap: () => logOut(context),
                    child: const Icon(
                      Icons.logout_rounded,
                      size: 30,
                      color: cTersier,
                    ),
                  ),
                ),
                Container(
                  transform: Matrix4.translationValues(0.0, -50.0, 0.0),
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    color: cBlack,
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(color: cWhite, width: 2),
                  ),
                  child: isLoading
                      ? Container()
                      : profileData.data.profile_picture == ''
                          ? Container()
                          : CircleAvatar(
                              radius: 100,
                              backgroundImage: NetworkImage(
                                  "$imageUrl${profileData.data.profile_picture}"),
                            ),
                ),
                Text(
                  isLoading ? "..." : profileData.data.name,
                  style: h1(cBlack),
                  textAlign: TextAlign.center,
                ),
                Text(
                  isLoading ? "..." : profileData.data.email,
                  style: h4(cGray),
                  textAlign: TextAlign.center,
                ),
                const SosmedCatalog(),
                isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : FollowAndLike(
                        followers: profileData.data.followers,
                        following: profileData.data.following,
                        username: profileData.data.username,
                      ),
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

logOut(BuildContext context) async {
  final pref = await SharedPreferences.getInstance();
  await pref.clear().then((_) {
    pushNewScreen(
      context,
      screen: const Login(),
      withNavBar: false,
      pageTransitionAnimation: PageTransitionAnimation.cupertino,
    );
  });
}
