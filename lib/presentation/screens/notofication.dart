import 'package:bumble_bot/data/repository/notification_repository.dart';
import 'package:flutter/material.dart';
import '../../data/model/list_notification_model.dart';
import '../global/colors.dart';
import '../global/fonts.dart';
import '../global/size.dart';
import '../widgets/button/back_button.dart';

class NotificationBase extends StatefulWidget {
  const NotificationBase({
    Key? key,
  }) : super(key: key);

  @override
  State<NotificationBase> createState() => _NotificationBaseState();
}

class _NotificationBaseState extends State<NotificationBase> {
  bool isLoading = true;
  ListNotificationModel? notif;

  @override
  void initState() {
    super.initState();
    getNotification();
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
                        children: notif!.data.map((value) {
                          return Container(
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom: BorderSide(width: 1.0, color: cGray),
                              ),
                            ),
                            width: sWidthFull(context),
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(value.title, style: h3(cBlack)),
                                const SizedBox(height: 5),
                                Text(value.content, style: h4(cBlack)),
                                const SizedBox(height: 5),
                                Text(value.created_at, style: h5(cGray)),
                              ],
                            ),
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

  getNotification() async {
    await NotificationRepository().getNotification().then((value) {
      setState(() {
        notif = value;
        isLoading = false;
      });
    });
  }
}
