import 'dart:async';

import 'package:bumble_bot/data/model/chat_model.dart';
import 'package:bumble_bot/data/repository/chat_repository.dart';
import 'package:bumble_bot/presentation/widgets/button/back_button_chat.dart';
import 'package:bumble_bot/presentation/widgets/contain/server_chat.dart';
import 'package:bumble_bot/presentation/widgets/contain/user_chat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../global/colors.dart';
import '../global/size.dart';

class Chat extends StatefulWidget {
  final String roomId;
  const Chat({Key? key, required this.roomId}) : super(key: key);

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  String username = '';
  bool isLoading = true;
  String nameRoom = '';
  ChatModel? data;

  TextEditingController textToSendConStroller = TextEditingController();

  void _refreshPage() {
    setState(() {
      getChat();
    });
  }

  Timer? timer;
  @override
  void initState() {
    super.initState();

    getUsername();
    getChat();
    timer =
        Timer.periodic(const Duration(seconds: 2), (Timer t) => _refreshPage());
  }

  @override
  void dispose() {
    // hapus timer saat widget di dispose
    timer?.cancel();
    super.dispose();
  }

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
                BackButtonChat(name: nameRoom),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  color: const Color.fromARGB(255, 235, 229, 214),
                  width: sWidthFull(context),
                  height: isKeyboardVisible
                      ? highContain - sKeyboard(context)
                      : highContain,
                  child: SingleChildScrollView(
                    // reverse: isKeyboardVisible ? true : false,
                    reverse: true,

                    child: isLoading
                        ? const Center(child: CircularProgressIndicator())
                        : Column(
                            children: data!.data.map((value) {
                            return value.username == username
                                ? UserChat(message: value.message)
                                : ServerChat(message: value.message);
                          }).toList()),
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
                        child: TextField(
                          controller: textToSendConStroller,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Talk ...',
                          ),
                        ),
                      ),
                      // !isKeyboardVisible
                      // ? Container(
                      //     width: sWidthDynamic(context, 0.2) - 32,
                      //     height: sHeightBackButton(context) - 10,
                      //     margin: const EdgeInsets.only(right: 20),
                      //     decoration: BoxDecoration(
                      //       color: cTersier,
                      //       borderRadius: BorderRadius.circular(40),
                      //       border: Border.all(width: 1, color: cGray),
                      //     ),
                      //     child:
                      //         const Icon(Icons.camera_alt, color: cWhite),
                      //   )
                      // :
                      GestureDetector(
                        onTap: () => postMessage(),
                        child: Container(
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

  getUsername() async {
    final pref = await SharedPreferences.getInstance();
    setState(() {
      username = pref.getString('Username') ?? '';
    });
  }

  getChat() async {
    await ChatRepository().getChat(widget.roomId).then((value) {
      setState(() {
        data = value;
        isLoading = false;
        nameRoom = value.room_info.room_name;
      });
    });
  }

  postMessage() async {
    if (textToSendConStroller.value.text != '') {
      await ChatRepository()
          .postMessage(widget.roomId, textToSendConStroller.value.text)
          .then((_) {
        setState(() {
          textToSendConStroller.clear();
        });
      });
    }
  }
}
