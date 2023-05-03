import 'package:bumble_bot/data/model/detail_user_model.dart';
import 'package:bumble_bot/data/repository/chat_repository.dart';
import 'package:bumble_bot/data/repository/profile_repository.dart';
import 'package:bumble_bot/presentation/global/colors.dart';
import 'package:bumble_bot/presentation/global/fonts.dart';
import 'package:bumble_bot/presentation/global/size.dart';
import 'package:bumble_bot/presentation/screens/chat.dart';
import 'package:bumble_bot/presentation/screens/list_chat.dart';
import 'package:bumble_bot/presentation/widgets/catalog/follow_and_like.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:persistent_bottom_nav_bar_custom/persistent-tab-view.dart';

import '../../data/api/base_url.dart';
import '../../data/repository/contain_repository.dart';

class UserProfile extends StatefulWidget {
  final String username;
  const UserProfile({Key? key, required this.username}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  bool isLoading = true;
  late DetailUserModel profileData;
  bool isFollow = false;
  @override
  void initState() {
    super.initState();
    getProfile();
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
                  alignment: Alignment.topLeft,
                  width: sWidthFull(context),
                  padding: const EdgeInsets.all(20),
                  height: 150,
                  color: cBlue,
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child:
                        const Icon(Icons.arrow_back, size: 30, color: cWhite),
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
                                "$imageUrl${profileData.data.profile_picture}",
                              ),
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
                Container(
                  margin: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      followChecker(),
                      message(),
                    ],
                  ),
                ),
                isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : FollowAndLike(
                        followers: profileData.data.followers,
                        following: profileData.data.following,
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget message() {
    return GestureDetector(
      onTap: () => toMesaage(),
      child: Container(
        width: sWidthDynamic(context, 0.4),
        height: 40,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: cTersier,
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
            const Icon(Icons.message, color: cWhite, size: 30),
            const SizedBox(width: 15),
            Text('Message', style: h3(cWhite))
          ],
        ),
      ),
    );
  }

  Widget followChecker() {
    return GestureDetector(
      onTap: () => isLoading ? null : postFollow(),
      child: Container(
        alignment: Alignment.center,
        width: sWidthDynamic(context, 0.4),
        height: 40,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          color: isFollow ? cTersier : cWhite,
          boxShadow: const [
            BoxShadow(
              color: cGray,
              blurRadius: 1,
              offset: Offset(0, 1), // Shadow position
            ),
          ],
        ),
        child: Text(isFollow ? 'Unfollow' : 'Follow',
            style: h1(isFollow ? cWhite : cTersier)),
      ),
    );
  }

  getProfile() async {
    await ProfileRepository().getUserDataRepo(widget.username).then((value) {
      setState(() {
        profileData = value;
        isLoading = false;
        if (value.data.isfollow == 1) {
          isFollow = true;
        }
      });
    });
  }

  postFollow() async {
    try {
      await ContainRepository()
          .postFollow(widget.username, isFollow ? "unfollow" : "follow")
          .then((value) {
        setState(() {
          isFollow = !isFollow;
        });
      });
    } catch (_) {
      setState(() {
        isFollow = !isFollow;
      });
    }
  }

  toMesaage() async {
    await ChatRepository().postMessagePersonal(widget.username).then((value) {
      if (value.status == 'success') {
        pushNewScreen(
          context,
          screen: Chat(roomId: value.room_id.toString()),
          withNavBar: true, // OPTIONAL VALUE. True by default.
          pageTransitionAnimation: PageTransitionAnimation.cupertino,
        );
      } else {
        pushNewScreen(
          context,
          screen: const ListCats(),
          withNavBar: true, // OPTIONAL VALUE. True by default.
          pageTransitionAnimation: PageTransitionAnimation.cupertino,
        );
      }
    });
  }
}
