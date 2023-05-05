import 'package:bumble_bot/data/model/list_follow_model.dart';
import 'package:bumble_bot/data/repository/user_repository.dart';
import 'package:flutter/material.dart';
import '../../data/api/base_url.dart';
import '../global/colors.dart';
import '../global/fonts.dart';
import '../global/size.dart';
import '../widgets/button/back_button.dart';

class Followers extends StatefulWidget {
  final String username;
  const Followers({Key? key, required this.username}) : super(key: key);

  @override
  State<Followers> createState() => _FollowersState();
}

class _FollowersState extends State<Followers> {
  bool isLoading = true;
  ListFollowModel? follow;

  @override
  void initState() {
    super.initState();
    getFollow();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            const BackButtonCustome(),
            SizedBox(
              height: sHeightScreen(context) - sHeightBackButton(context),
              child: SingleChildScrollView(
                  child: isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : Column(
                          children: follow!.data.map((value) {
                          return Card(
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              width: sWidthFull(context),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
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
                                ],
                              ),
                            ),
                          );
                        }).toList())),
            ),
          ],
        ),
      ),
    );
  }

  getFollow() async {
    await UserRepositoty().postListFollower(widget.username).then((value) {
      setState(() {
        follow = value;
        isLoading = false;
      });
    });
  }
}
