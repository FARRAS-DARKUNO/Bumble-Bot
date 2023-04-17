import 'package:bumble_bot/presentation/widgets/box_input/input_image.dart';
import 'package:bumble_bot/presentation/widgets/box_input/text_normal_input.dart';
import 'package:bumble_bot/presentation/widgets/button/normal_button.dart';
import 'package:flutter/material.dart';
import '../global/size.dart';
import '../widgets/button/back_button.dart';

class StoryPost extends StatelessWidget {
  StoryPost({
    Key? key,
  }) : super(key: key);

  final caption = TextEditingController();
  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: Column(
              children: <Widget>[
                const BackButtonCustome(),
                SizedBox(
                  height: sHeightScreen(context) - sHeightBackButton(context),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(height: 30),
                        const InputImage(),
                        const SizedBox(height: 30),
                        TextNormalInput(hintText: 'Caption', text: caption),
                        const SizedBox(height: 30),
                        const NormalButton(title: 'Story'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
