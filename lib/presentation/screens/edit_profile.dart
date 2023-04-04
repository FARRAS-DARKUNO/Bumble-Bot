import 'package:bumble_bot/presentation/widgets/box_input/text_normal_input.dart';
import 'package:bumble_bot/presentation/widgets/button/normal_button.dart';
import 'package:flutter/material.dart';

import '../global/colors.dart';
import '../global/size.dart';
import '../widgets/button/back_button.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({
    Key? key,
  }) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
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
                  child: Column(
                    children: [
                      const SizedBox(height: 30),
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          color: cBlack,
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(color: cWhite, width: 2),
                        ),
                      ),
                      const SizedBox(height: 30),
                      const TextNormalInput(hintText: 'Farras'),
                      const SizedBox(height: 30),
                      const NormalButton(
                        title: 'Submit',
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
