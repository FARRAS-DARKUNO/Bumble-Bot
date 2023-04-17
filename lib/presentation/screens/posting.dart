import 'package:bumble_bot/presentation/widgets/box_input/add_location_on_posting.dart';
import 'package:bumble_bot/presentation/widgets/box_input/add_people_on_posting.dart';
import 'package:bumble_bot/presentation/widgets/box_input/hashtag_dropdown.dart';
import 'package:bumble_bot/presentation/widgets/box_input/input_image.dart';
import 'package:bumble_bot/presentation/widgets/box_input/text_normal_input.dart';
import 'package:bumble_bot/presentation/widgets/button/normal_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import '../global/size.dart';
import '../widgets/button/back_button.dart';

class Posting extends StatelessWidget {
  Posting({
    Key? key,
  }) : super(key: key);

  final title = TextEditingController();
  final hadtag = TextEditingController();
  final caption = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(
      builder: (context, isKeyboardVisible) => GestureDetector(
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
                    reverse: isKeyboardVisible,
                    child: Column(
                      children: [
                        const InputImage(),
                        const SizedBox(height: 10),
                        TextNormalInput(hintText: 'Title', text: title),
                        const SizedBox(height: 10),
                        const HashtagDropdown(hintText: 'Hashtag'),
                        const SizedBox(height: 10),
                        TextNormalInput(hintText: 'Caption', text: caption),
                        const SizedBox(height: 10),
                        const AddPeopleOnPosting(),
                        const SizedBox(height: 10),
                        const AddLocationOnPosting(),
                        const SizedBox(height: 30),
                        const NormalButton(title: 'Story'),
                        sPaddingBottom(context),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
