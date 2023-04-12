import 'package:flutter/material.dart';
import '../global/colors.dart';
import '../global/fonts.dart';
import '../global/size.dart';
import '../widgets/button/back_button.dart';
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
          ],
          onComplete: () => Navigator.pop(context),
          inline: false,
          repeat: false,
        ));
  }
}
