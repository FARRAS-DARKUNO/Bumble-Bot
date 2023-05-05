import 'package:bumble_bot/data/repository/chat_repository.dart';
import 'package:bumble_bot/data/repository/user_repository.dart';
import 'package:bumble_bot/presentation/widgets/alert/alert_dynamic.dart';
import 'package:bumble_bot/presentation/widgets/button/back_button.dart';
import 'package:flutter/material.dart';
import '../../data/api/base_url.dart';
import '../../data/model/list_user_model.dart';
import '../global/colors.dart';
import '../global/fonts.dart';
import '../global/size.dart';

class AddToGroup extends StatefulWidget {
  final String roomId;
  const AddToGroup({Key? key, required this.roomId}) : super(key: key);

  @override
  State<AddToGroup> createState() => _AddToGroupState();
}

class _AddToGroupState extends State<AddToGroup> {
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
                              return GestureDetector(
                                onTap: () => postAddPerson(value.username),
                                child: Card(
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 10),
                                    width: sWidthFull(context),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        CircleAvatar(
                                          radius: 20,
                                          backgroundImage: NetworkImage(
                                              "$imageUrl${value.profile_picture}"),
                                        ),
                                        const SizedBox(width: 10),
                                        Container(
                                          alignment: Alignment.centerLeft,
                                          width: sWidthDynamic(context, 0.55),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(value.name,
                                                  style: h3(cBlack)),
                                              Text(
                                                value.username,
                                                style: h5(cGray),
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
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

  postAddPerson(String username) async {
    await ChatRepository()
        .postAddPeopleToGroup(widget.roomId, username)
        .then((value) {
      if (value.status == 'Error') {
        Navigator.pop(context);
        alertDynamic(
          context,
          "Terjadi Kesalahan",
          "User sudah pernah di tambahkan",
        );
      } else {
        Navigator.pop(context);
        alertDynamic(context, value.status, value.message);
      }
    });
  }
}
