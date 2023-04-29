import 'package:bumble_bot/data/repository/contain_repository.dart';
import 'package:bumble_bot/presentation/global/size.dart';
import 'package:bumble_bot/presentation/screens/detail_post.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_custom/persistent-tab-view.dart';

import '../../../data/api/base_url.dart';
import '../../global/colors.dart';
import '../../global/fonts.dart';

class PhotoPostContain extends StatefulWidget {
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

  const PhotoPostContain({
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
  State<PhotoPostContain> createState() => _PhotoPostContainState();
}

class _PhotoPostContainState extends State<PhotoPostContain> {
  bool isFollow = true;
  bool isLike = false;

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
            child: Image.network("$imageUrl${widget.image}", fit: BoxFit.cover),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              giftUi(context),
              Row(
                children: [
                  GestureDetector(
                    onTap: () => postLike(),
                    child: Icon(Icons.favorite,
                        size: 30, color: isLike ? cRed : cGray),
                  ),
                  const SizedBox(width: 10),
                  const Icon(Icons.share, size: 30, color: cGray)
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

  Widget profileUI(
    BuildContext context,
    String image,
    String name,
    String username,
    String id,
    bool isdetail,
  ) {
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
        GestureDetector(
          onTap: () => postFollow(),
          child: Container(
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
            child: Text(isFollow ? "Unfollow" : "Follow", style: h4(cPremier)),
          ),
        ),
      ],
    );
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

  postLike() async {
    try {
      await ContainRepository()
          .postLike(widget.id, isLike ? "hapuslike" : "like")
          .then((value) {
        setState(() {
          isLike = !isLike;
        });
      });
    } catch (_) {
      setState(() {
        isLike = !isLike;
      });
    }
  }
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
          // const SizedBox(height: 10),
          // Row(
          //   children: [
          //     const Icon(Icons.people, size: 14, color: cPremier),
          //     SizedBox(
          //       width: sWidthFull(context) - 45 - 14,
          //       child: Text(
          //         '  Jl manggis Jl, auihaohsmm, sadhom , doahs , asidm, dajkdaefefefe',
          //         overflow: TextOverflow.ellipsis,
          //         style: h5(cGray),
          //       ),
          //     )
          //   ],
          // )
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
