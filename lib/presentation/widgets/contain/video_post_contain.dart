import 'package:bumble_bot/presentation/global/size.dart';
import 'package:bumble_bot/presentation/screens/detail_post.dart';
import 'package:bumble_bot/presentation/widgets/contain/video_controller.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_custom/persistent-tab-view.dart';
import '../../../data/api/base_url.dart';
import '../../global/colors.dart';
import '../../global/fonts.dart';
import 'package:video_player/video_player.dart';

class VideoPostContain extends StatefulWidget {
  final String id;
  final String username;
  final String profilePicture;
  final String title;
  final String image;
  final String caption;
  final String hastag;
  final String location;
  final String name;
  final bool isDetail;

  const VideoPostContain({
    Key? key,
    required this.id,
    required this.username,
    required this.caption,
    required this.hastag,
    required this.image,
    required this.location,
    required this.profilePicture,
    required this.title,
    required this.name,
    required this.isDetail,
  }) : super(key: key);

  @override
  State<VideoPostContain> createState() => _VideoPostContainState();
}

class _VideoPostContainState extends State<VideoPostContain> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
      'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
      videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true),
    );

    _controller.addListener(() {
      setState(() {});
    });
    _controller.setLooping(true);
    _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 1.0, color: cGray),
        ),
      ),
      width: sWidthFull(context) - 40,
      child: Column(
        children: [
          profileUI(context, widget.profilePicture, widget.name,
              widget.username, widget.id, widget.isDetail),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            width: sWidthFull(context) - 40,
            height: 300,
            color: cBlack,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                VideoPlayer(_controller),
                ClosedCaption(text: _controller.value.caption.text),
                ControlsOverlay(controller: _controller),
                VideoProgressIndicator(_controller, allowScrubbing: false),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              giftUi(context),
              Row(
                children: const [
                  Icon(Icons.favorite, size: 30, color: cGray),
                  SizedBox(width: 10),
                  Icon(Icons.share, size: 30, color: cGray)
                ],
              ),
            ],
          ),
          descriptionUi(context, widget.caption, widget.hastag, widget.location,
              widget.id, widget.isDetail),
        ],
      ),
    );
  }
}

Widget profileUI(BuildContext context, String image, String name,
    String username, String id, bool isdetail) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      CircleAvatar(
        radius: 20,
        backgroundImage: NetworkImage("$imageUrl$image"),
      ),
      GestureDetector(
        onTap: () => isdetail ? null : gotoDetail(context, id),
        child: SizedBox(
          width: sWidthDynamic(context, 0.97) - 50 - 80 - 40,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(name, style: h4(cBlack)),
              Text(username, style: h5(cGray))
            ],
          ),
        ),
      ),
      Container(
        alignment: Alignment.center,
        height: 30,
        width: 80,
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
        child: Text('Unollow', style: h4(cPremier)),
      ),
    ],
  );
}

Widget giftUi(BuildContext context) {
  return Container(
    alignment: Alignment.center,
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
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
      gradient: const LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment(1, 0),
        colors: <Color>[cTersier, cPremier],
      ),
    ),
    child: Row(
      children: [
        const Icon(Icons.wallet_giftcard, color: cWhite, size: 24),
        Text(" Gift", style: h3(cWhite))
      ],
    ),
  );
}

Widget descriptionUi(BuildContext context, String description, String hastag,
    String location, String id, bool isdetail) {
  return GestureDetector(
    onTap: () => isdetail ? null : gotoDetail(context, id),
    child: Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      width: sWidthFull(context) - 45,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            description,
            style: h4(cBlack),
            textAlign: TextAlign.justify,
          ),
          hastag == ' ' ? const SizedBox(height: 10) : Container(),
          Text(
            hastag,
            style: h5(cBlue),
          ),
          location == ' ' ? const SizedBox(height: 10) : Container(),
          location == ' '
              ? Row(
                  children: [
                    const Icon(Icons.pin_drop_rounded,
                        size: 14, color: cPremier),
                    SizedBox(
                      width: sWidthFull(context) - 45 - 14,
                      child: Text(
                        location,
                        overflow: TextOverflow.ellipsis,
                        style: h5(cGray),
                      ),
                    )
                  ],
                )
              : Container(),
        ],
      ),
    ),
  );
}

gotoDetail(BuildContext context, String id) {
  pushNewScreen(
    context,
    screen: DetailPost(id: id),
    withNavBar: false,
    pageTransitionAnimation: PageTransitionAnimation.cupertino,
  );
}
