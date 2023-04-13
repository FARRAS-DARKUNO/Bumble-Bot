import 'package:flutter/material.dart';
import 'package:story_view/story_view.dart';

class SnapStory extends StatelessWidget {
  const SnapStory({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = StoryController();
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: StoryView(
          controller: controller,
          storyItems: [
            StoryItem.pageImage(
              url:
                  'https://thumbs.dreamstime.com/z/hand-man-reaching-to-towards-sky-make-symbol-118400493.jpg',
              controller: controller,
              caption: 'Mantaps betuuuul wkwkwk',
            ),
            StoryItem.pageImage(
              url:
                  'https://thumbs.dreamstime.com/z/hand-man-reaching-to-towards-sky-make-symbol-118400493.jpg',
              controller: controller,
            ),
            StoryItem.pageVideo(
              'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
              controller: controller,
              duration: const Duration(seconds: 15),
              caption: '',
            )
          ],
          onComplete: () => Navigator.pop(context),
          inline: false,
          repeat: false,
        ));
  }
}
