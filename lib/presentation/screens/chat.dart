import 'package:bumble_bot/presentation/widgets/button/back_button_chat.dart';
import 'package:bumble_bot/presentation/widgets/contain/server_chat.dart';
import 'package:bumble_bot/presentation/widgets/contain/user_chat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import '../global/colors.dart';
import '../global/size.dart';

class Chat extends StatefulWidget {
  const Chat({
    Key? key,
  }) : super(key: key);

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
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
                const BackButtonChat(),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  color: const Color.fromARGB(255, 235, 229, 214),
                  width: sWidthFull(context),
                  height: isKeyboardVisible
                      ? highContain - sKeyboard(context)
                      : highContain,
                  child: SingleChildScrollView(
                    reverse: isKeyboardVisible ? true : false,
                    child: Column(
                      children: const <Widget>[
                        ServerChat(message: "hallo ?"),
                        UserChat(message: "Iya Kenapa ?"),
                        ServerChat(message: "hallo ?"),
                        UserChat(message: "Iya Kenapa ?"),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: sHeightInputComments(context) - 20,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        width: sWidthDynamic(context, 0.8) - 22,
                        margin: const EdgeInsets.only(left: 20),
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          border: Border.all(width: 1, color: cPremier),
                        ),
                        child: const TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Talk ...',
                          ),
                        ),
                      ),
                      !isKeyboardVisible
                          ? Container(
                              width: sWidthDynamic(context, 0.2) - 32,
                              height: sHeightBackButton(context) - 10,
                              margin: const EdgeInsets.only(right: 20),
                              decoration: BoxDecoration(
                                color: cTersier,
                                borderRadius: BorderRadius.circular(40),
                                border: Border.all(width: 1, color: cGray),
                              ),
                              child:
                                  const Icon(Icons.camera_alt, color: cWhite),
                            )
                          : Container(
                              width: sWidthDynamic(context, 0.2) - 32,
                              height: sHeightBackButton(context) - 10,
                              margin: const EdgeInsets.only(right: 20),
                              decoration: BoxDecoration(
                                color: cTersier,
                                borderRadius: BorderRadius.circular(40),
                                border: Border.all(width: 1, color: cGray),
                              ),
                              child: const Icon(Icons.send, color: cWhite),
                            ),
                    ],
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
