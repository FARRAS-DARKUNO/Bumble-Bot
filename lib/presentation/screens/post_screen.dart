import 'package:bumble_bot/data/model/post_contain_model.dart';
import 'package:bumble_bot/data/repository/contain_repository.dart';
import 'package:bumble_bot/presentation/global/colors.dart';
import 'package:bumble_bot/presentation/global/fonts.dart';
import 'package:bumble_bot/presentation/global/size.dart';
import 'package:bumble_bot/presentation/screens/posting.dart';
import 'package:bumble_bot/presentation/widgets/contain/video_post_contain.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_custom/persistent-tab-view.dart';

import '../widgets/contain/photo_post_contain.dart';
import 'list_chat.dart';
import 'notofication.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  List<PostContainModel> data = [];

  int page = 1;
  bool isLoading = true;
  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(scrollHandle);
    getListPost();
  }

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
              controller: scrollController,
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
                            const SizedBox(width: 20),
                            GestureDetector(
                              onTap: () => gotoChats(context),
                              child: const Icon(
                                Icons.message,
                                color: cPremier,
                                size: 30,
                              ),
                            ),
                            const SizedBox(width: 20),
                            GestureDetector(
                              onTap: () => gotoNotification(context),
                              child: const Icon(
                                Icons.notifications,
                                color: cPremier,
                                size: 30,
                              ),
                            )
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
                  isLoading
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : Column(
                          children: data.map((value) {
                          return value.typefile == 'image'
                              ? PhotoPostContain(
                                  id: value.id,
                                  username: value.username,
                                  caption: value.caption,
                                  hastag: value.hashtag,
                                  image: value.image,
                                  location: value.location,
                                  profilePicture: value.profile_picture,
                                  title: value.title,
                                  name: value.name,
                                  isDetail: false,
                                  isFollow: value.isfollow,
                                  isLike: value.islike,
                                  wallet: value.wallet,
                                )
                              : VideoPostContain(
                                  id: value.id,
                                  username: value.username,
                                  caption: value.caption,
                                  hastag: value.hashtag,
                                  image: value.image,
                                  location: value.location,
                                  profilePicture: value.profile_picture,
                                  title: value.title,
                                  name: value.name,
                                  isDetail: false,
                                  isFollow: value.isfollow,
                                  isLike: value.islike,
                                  wallet: value.wallet,
                                );
                        }).toList()),
                  const SizedBox(height: 30)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  getListPost() async {
    try {
      ContainRepository().getContainPost(page).then((value) {
        setState(() {
          data = data + value;
          isLoading = false;
          page += 1;
        });
      });
    } catch (_) {}
  }

  scrollHandle() {
    if (isLoading) return;
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      getListPost();
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

  gotoNotification(BuildContext context) {
    pushNewScreen(
      context,
      screen: const NotificationBase(),
      withNavBar: true, // OPTIONAL VALUE. True by default.
      pageTransitionAnimation: PageTransitionAnimation.cupertino,
    );
  }

  gotoChats(BuildContext context) {
    pushNewScreen(
      context,
      screen: const ListCats(),
      withNavBar: true, // OPTIONAL VALUE. True by default.
      pageTransitionAnimation: PageTransitionAnimation.cupertino,
    );
  }
}
