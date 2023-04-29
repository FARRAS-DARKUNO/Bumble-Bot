import 'package:bumble_bot/presentation/global/colors.dart';
import 'package:bumble_bot/presentation/global/fonts.dart';
import 'package:bumble_bot/presentation/global/size.dart';
import 'package:bumble_bot/presentation/widgets/card/card_profile_notification.dart';
import 'package:bumble_bot/presentation/widgets/contain/photo_post_contain.dart';
import 'package:bumble_bot/presentation/widgets/contain/slide_post.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../data/model/post_contain_model.dart';
import '../../data/repository/contain_repository.dart';
import '../widgets/contain/carousel_slider.dart';
import '../widgets/contain/video_post_contain.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: cPremier,
    ));
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: sHeightScreen(context),
          child: SingleChildScrollView(
            controller: scrollController,
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
                  child: Text('Lates News', style: h4(cGray)),
                ),
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
                              );
                      }).toList()),
                const SizedBox(height: 30)
              ],
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
}
