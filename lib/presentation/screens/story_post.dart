import 'dart:io';

import 'package:bumble_bot/data/repository/contain_repository.dart';
import 'package:bumble_bot/presentation/screens/login.dart';
import 'package:bumble_bot/presentation/widgets/alert/alert_dynamic.dart';
import 'package:bumble_bot/presentation/widgets/box_input/input_image.dart';
import 'package:bumble_bot/presentation/widgets/box_input/text_normal_input.dart';
import 'package:bumble_bot/presentation/widgets/button/normal_button.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_custom/persistent-tab-view.dart';
import '../global/size.dart';
import '../widgets/button/back_button.dart';
import '../widgets/navigation/navigation.dart';

class StoryPost extends StatefulWidget {
  const StoryPost({
    Key? key,
  }) : super(key: key);

  @override
  State<StoryPost> createState() => _StoryPostState();
}

class _StoryPostState extends State<StoryPost> {
  bool isLoaing = false;
  File? image;
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
                        InputImage(onChangeFile: (value) => getImage(value)),
                        const SizedBox(height: 30),
                        TextNormalInput(hintText: 'Caption', text: caption),
                        const SizedBox(height: 30),
                        GestureDetector(
                          onTap: () => isLoaing ? null : onSubmitStory(),
                          child: NormalButton(
                              title: isLoaing ? 'Loading...' : 'Story'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );

  getImage(File? data) {
    setState(() {
      image = data;
    });
  }

  onSubmitStory() async {
    setState(() {
      isLoaing = true;
    });
    if (image != null) {
      await ContainRepository()
          .postStory(caption.value.text, image!)
          .then((value) {
        setState(() {
          isLoaing = false;
          gotoBack(context);
          alertDynamic(context, value.status, value.message);
        });
      }).catchError((error) => gotoLogin(context));
    } else {
      setState(() {
        isLoaing = false;
        alertDynamic(context, 'Terjadi kelasahan', "File tidak bolek kosong");
      });
    }
  }

  gotoBack(BuildContext context) {
    pushNewScreen(
      context,
      screen: const Navigation(),
      withNavBar: false, // OPTIONAL VALUE. True by default.
      pageTransitionAnimation: PageTransitionAnimation.cupertino,
    );
  }

  gotoLogin(BuildContext context) {
    pushNewScreen(
      context,
      screen: const Login(),
      withNavBar: false, // OPTIONAL VALUE. True by default.
      pageTransitionAnimation: PageTransitionAnimation.cupertino,
    );
  }
}
