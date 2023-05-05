import 'package:bumble_bot/data/model/list_stoty_model.dart';
import 'package:bumble_bot/data/repository/contain_repository.dart';
import 'package:bumble_bot/presentation/widgets/card/card_add_post.dart';
import 'package:bumble_bot/presentation/widgets/card/card_post_circle.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SlidePost extends StatefulWidget {
  const SlidePost({
    Key? key,
  }) : super(key: key);

  @override
  State<SlidePost> createState() => _SlidePostState();
}

class _SlidePostState extends State<SlidePost> {
  bool isLoading = true;
  String username = '';
  String image = '';

  List<Data> story = [Data(username: "", profile_picture: '')];

  getListStory() async {
    final pref = await SharedPreferences.getInstance();
    var uname = pref.getString('Username') ?? '';
    var imag = pref.getString('Image') ?? '';

    await ContainRepository().getListStory().then((value) {
      setState(() {
        image = imag;
        username = uname;
        story = story + value.data;
        isLoading = false;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getListStory();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              scrollDirection: Axis.horizontal,
              children: story.map((value) {
                return story.indexOf(value) == 0
                    ? CardAddPost(username: username, image: image)
                    : value.username == username
                        ? Container()
                        : CardPostCircle(
                            image: value.profile_picture,
                            username: value.username,
                          );
              }).toList(),
            ),
    );
  }
}
