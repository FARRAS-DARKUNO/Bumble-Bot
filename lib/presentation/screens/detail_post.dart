import 'package:bumble_bot/data/repository/contain_repository.dart';
import 'package:bumble_bot/presentation/global/fonts.dart';
import 'package:bumble_bot/presentation/global/size.dart';
import 'package:bumble_bot/presentation/widgets/box_input/comments.dart';
import 'package:bumble_bot/presentation/widgets/button/back_button_category.dart';
import 'package:bumble_bot/presentation/widgets/contain/comments.dart';
import 'package:bumble_bot/presentation/widgets/contain/video_post_contain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

import '../../data/model/post_contain_model.dart';
import '../global/colors.dart';
import '../widgets/contain/photo_post_contain.dart';

class DetailPost extends StatefulWidget {
  final String id;
  const DetailPost({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<DetailPost> createState() => _DetailPostState();
}

class _DetailPostState extends State<DetailPost> {
  late PostContainModel data;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getDetail(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    double highContain = sHeightScreenComments(context) -
        sHeightInputComments(context) -
        sHeightBackButton(context);
    return KeyboardVisibilityBuilder(
      builder: (context, isKeyboardVisible) => GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: Column(
              children: [
                const BackButtonCategoty(category: 'Article'),
                SizedBox(
                  width: sWidthFull(context),
                  height: isKeyboardVisible
                      ? highContain - sKeyboard(context)
                      : highContain,
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        isLoading
                            ? const Center(
                                child: CircularProgressIndicator(),
                              )
                            : data.typefile == 'image'
                                ? PhotoPostContain(
                                    id: data.id,
                                    username: data.username,
                                    caption: data.caption,
                                    hastag: data.caption,
                                    image: data.image,
                                    location: data.location,
                                    profilePicture: data.profile_picture,
                                    title: data.title,
                                    name: data.name,
                                    isDetail: true,
                                    isFollow: data.isfollow,
                                    isLike: data.islike,
                                  )
                                : VideoPostContain(
                                    id: data.id,
                                    username: data.username,
                                    caption: data.caption,
                                    hastag: data.caption,
                                    image: data.image,
                                    location: data.location,
                                    profilePicture: data.profile_picture,
                                    title: data.title,
                                    name: data.name,
                                    isDetail: true,
                                    isFollow: data.isfollow,
                                    isLike: data.islike,
                                  ),
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(width: 1.0, color: cGray),
                            ),
                          ),
                          width: sWidthFull(context) - 40,
                          child: Text('Comments', style: h2(cPremier)),
                        ),
                        const Comments()
                      ],
                    ),
                  ),
                ),
                const CommentsInput(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  getDetail(String id) async {
    ContainRepository().getDetailContainPost(id).then((value) {
      setState(() {
        data = value;
        isLoading = false;
      });
    });
  }
}
