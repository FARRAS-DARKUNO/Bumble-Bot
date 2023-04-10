import 'package:bumble_bot/presentation/global/fonts.dart';
import 'package:bumble_bot/presentation/global/size.dart';
import 'package:bumble_bot/presentation/widgets/box_input/comments.dart';
import 'package:bumble_bot/presentation/widgets/button/back_button_category.dart';
import 'package:bumble_bot/presentation/widgets/contain/comments.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

import '../global/colors.dart';
import '../widgets/contain/photo_post_contain.dart';

class DetailPost extends StatelessWidget {
  const DetailPost({
    Key? key,
  }) : super(key: key);

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
                        const PhotoPostContain(),
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
}
