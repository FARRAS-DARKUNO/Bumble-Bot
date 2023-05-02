import 'package:bumble_bot/data/repository/chat_repository.dart';
import 'package:bumble_bot/presentation/widgets/button/back_button_add_chats.dart';
import 'package:bumble_bot/presentation/widgets/card/card_chat.dart';
import 'package:flutter/material.dart';
import '../../data/model/list_chat_model.dart';
import '../global/size.dart';

class ListCats extends StatefulWidget {
  const ListCats({
    Key? key,
  }) : super(key: key);

  @override
  State<ListCats> createState() => _ListCatsState();
}

class _ListCatsState extends State<ListCats> {
  ListChatModel? data;
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    getListChat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            const BackButtonAddChats(),
            SizedBox(
              height: sHeightScreen(context) - sHeightBackButton(context),
              child: SingleChildScrollView(
                child: isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : Column(
                        children: data!.data.map((value) {
                          return CardChat(
                            id: value.id,
                            createdAt: value.created_at,
                            creator: value.creator,
                            name: value.name,
                            type: value.type,
                          );
                        }).toList(),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  getListChat() async {
    await ChatRepository().getListChat().then((value) {
      setState(() {
        data = value;
        isLoading = false;
      });
    });
  }
}
