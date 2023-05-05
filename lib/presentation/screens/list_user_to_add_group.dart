import 'package:bumble_bot/data/repository/chat_repository.dart';
import 'package:bumble_bot/data/repository/user_repository.dart';
import 'package:bumble_bot/presentation/widgets/alert/alert_dynamic.dart';
import 'package:bumble_bot/presentation/widgets/box_input/text_normal_input.dart';
import 'package:bumble_bot/presentation/widgets/button/back_button.dart';
import 'package:bumble_bot/presentation/widgets/button/normal_button.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_custom/persistent-tab-view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../data/api/base_url.dart';
import '../../data/model/list_user_model.dart';
import '../global/colors.dart';
import '../global/fonts.dart';
import '../global/size.dart';
import 'list_chat.dart';

class ListUserToAddGroup extends StatefulWidget {
  const ListUserToAddGroup({
    Key? key,
  }) : super(key: key);

  @override
  State<ListUserToAddGroup> createState() => _ListUserToAddGroupState();
}

class _ListUserToAddGroupState extends State<ListUserToAddGroup> {
  List<ListUserModel> data = [];
  TextEditingController controllerText = TextEditingController();
  TextEditingController controllerTitleGroup = TextEditingController();
  bool isLoading = false;
  List<String> listPeople = [];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Column(
            children: <Widget>[
              const BackButtonCustome(),
              SizedBox(
                height: sHeightScreen(context) - sHeightBackButton(context),
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextNormalInput(
                        text: controllerTitleGroup,
                        hintText: "Title Group",
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: sWidthDynamic(context, 1) - 40 - 14,
                          padding: const EdgeInsets.all(20),
                          child: TextField(
                            controller: controllerText,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  borderSide:
                                      BorderSide(color: cBlack, width: 89)),
                              labelText: 'Search User',
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isLoading = true;
                              getListGroup();
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.only(right: 20),
                            child: const Icon(Icons.search,
                                size: 32, color: cPremier),
                          ),
                        )
                      ],
                    ),
                    isLoading
                        ? const Center(child: CircularProgressIndicator())
                        : Column(
                            children: data.map((value) {
                              return Card(
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                  width: sWidthFull(context),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      CircleAvatar(
                                        radius: 20,
                                        backgroundImage: NetworkImage(
                                            "$imageUrl${value.profile_picture}"),
                                      ),
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        width: sWidthDynamic(context, 0.55),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(value.name, style: h3(cBlack)),
                                            Text(
                                              value.username,
                                              style: h5(cGray),
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Checkbox(
                                        value:
                                            listPeople.contains(value.username),
                                        onChanged: (bool? bolean) {
                                          setState(() {
                                            if (bolean == true) {
                                              listPeople.add(value.username);
                                            } else {
                                              listPeople.remove(value.username);
                                            }
                                          });
                                        },
                                      )
                                    ],
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                    GestureDetector(
                      onTap: () => postCreateGroup(),
                      child: Container(
                          margin: const EdgeInsets.all(24),
                          child: const NormalButton(title: "Create")),
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

  getListGroup() async {
    await UserRepositoty()
        .postListUser(controllerText.value.text)
        .then((value) {
      setState(() {
        data = value;
        isLoading = false;
      });
    });
  }

  postCreateGroup() async {
    if (listPeople.isNotEmpty && controllerTitleGroup.value.text != '') {
      final pref = await SharedPreferences.getInstance();
      var username = pref.getString('Username') ?? '';

      var passing = '["$username","${listPeople.join('", "')}"]';
      await ChatRepository()
          .postMessageGroup(passing, controllerTitleGroup.value.text)
          .then((value) {
        if (value.status == 'success') {
          pushNewScreen(
            context,
            screen: const ListCats(),
            withNavBar: true, // OPTIONAL VALUE. True by default.
            pageTransitionAnimation: PageTransitionAnimation.cupertino,
          );
          alertDynamic(context, value.status, value.message);
        } else {
          alertDynamic(
            context,
            "Terjadi Kesalahan",
            "Nama Group sudah terpakai atau ada kesalahan lain",
          );
        }
      });
    }
    // print(passinng);
  }
}
