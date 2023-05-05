import 'package:bumble_bot/data/api/base_url.dart';
import 'package:bumble_bot/data/repository/contain_repository.dart';
import 'package:flutter/material.dart';
import 'package:story_view/story_view.dart';

import '../../data/model/detail_story_model.dart';

class SnapStory extends StatefulWidget {
  final String username;
  const SnapStory({Key? key, required this.username}) : super(key: key);

  @override
  State<SnapStory> createState() => _SnapStoryState();
}

class _SnapStoryState extends State<SnapStory> {
  bool isLoading = true;

  DetailStoryModel? story;

  getStory() async {
    ContainRepository().getDetailStory(widget.username).then((value) {
      if (value.data.isEmpty) {
        Navigator.pop(context);
      } else {
        setState(() {
          story = value;
          isLoading = false;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    getStory();
  }

  @override
  Widget build(BuildContext context) {
    final controller = StoryController();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : StoryView(
              controller: controller,
              storyItems: story!.data.map((value) {
                return value.typefile == 'image'
                    ? StoryItem.pageImage(
                        url: '$imageUrl${value.image}',
                        controller: controller,
                      )
                    : StoryItem.pageVideo(
                        '$baseUrl${value.image}',
                        controller: controller,
                        duration: const Duration(seconds: 15),
                        caption: '',
                      );
              }).toList(),
              onComplete: () => Navigator.pop(context),
              inline: false,
              repeat: false,
            ),
    );
  }
}

// StoryItem.pageImage(
//               url:
//                   'https://thumbs.dreamstime.com/z/hand-man-reaching-to-towards-sky-make-symbol-118400493.jpg',
//               controller: controller,
//             ),
            // StoryItem.pageVideo(
            //   'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
            //   controller: controller,
            //   duration: const Duration(seconds: 15),
            //   caption: '',
            // )