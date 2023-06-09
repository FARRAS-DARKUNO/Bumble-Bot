import 'package:bumble_bot/presentation/global/fonts.dart';
import 'package:bumble_bot/presentation/global/size.dart';
import 'package:bumble_bot/presentation/screens/notofication.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_custom/persistent-tab-view.dart';

import '../../../data/api/base_url.dart';
import '../../../data/model/profile_model.dart';
import '../../../data/repository/profile_repository.dart';
import '../../global/colors.dart';

class CardProfileNotification extends StatefulWidget {
  const CardProfileNotification({
    Key? key,
  }) : super(key: key);

  @override
  State<CardProfileNotification> createState() =>
      _CardProfileNotificationState();
}

class _CardProfileNotificationState extends State<CardProfileNotification> {
  bool isLoading = true;
  late ProfileModel profileData;
  getProfile(context) async {
    await ProfileRepository().getProfileRepo().then((value) {
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
    return Container(
      decoration: BoxDecoration(
        color: cWhite,
        borderRadius: BorderRadius.circular(100),
        boxShadow: const [
          BoxShadow(
            color: cGray,
            blurRadius: 1,
            offset: Offset(0, 1), // Shadow position
          ),
        ],
      ),
      width: sWidthFull(context),
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: cBlack,
              borderRadius: BorderRadius.circular(100),
            ),
            child: isLoading
                ? Container()
                : profileData.data.profile_picture == ''
                    ? Container()
                    : CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(
                            "$imageUrl${profileData.data.profile_picture}"),
                      ),
          ),
          SizedBox(
            width: sWidthDynamic(context, 0.8) - 50 - 30,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  isLoading ? "..." : profileData.data.name,
                  style: h3(cBlack),
                ),
                Text(
                  isLoading ? "..." : profileData.data.email,
                  style: h5(cGray),
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () => gotoNotification(context),
            child: const Icon(
              Icons.notifications_rounded,
              size: 30,
              color: cPremier,
            ),
          )
        ],
      ),
    );
  }
}

gotoNotification(BuildContext context) {
  pushNewScreen(
    context,
    screen: const NotificationBase(),
    withNavBar: true, // OPTIONAL VALUE. True by default.
    pageTransitionAnimation: PageTransitionAnimation.cupertino,
  );
}
