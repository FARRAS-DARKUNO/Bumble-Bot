import 'dart:async';
import 'package:fcm_config/fcm_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bumble_bot/presentation/screens/splash_screen.dart';
import 'package:bumble_bot/provider/location_bloc/location_bloc.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("Handling a background message: ${message.messageId}");
}

Future<void> main() async {
  await FCMConfig.instance.init(
    onBackgroundMessage: _firebaseMessagingBackgroundHandler,
    defaultAndroidForegroundIcon:
        '@mipmap/ic_launcher', //default is @mipmap/ic_launcher
    defaultAndroidChannel: const AndroidNotificationChannel(
      'high_importance_channel', // same as value from android setup
      'Fcm config',
      importance: Importance.high,
      sound: RawResourceAndroidNotificationSound('notification'),
    ),
  );

  await FCMConfig.instance.getInitialMessage();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FCMNotificationClickListener(
      onNotificationClick:
          (RemoteMessage notification, void Function() setState) {
        print(notification.data.toString());
      },
      child: FCMNotificationListener(
        onNotification:
            (RemoteMessage notification, void Function() setState) {},
        child: MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => LocationBloc()),
          ],
          child: MaterialApp(
            title: 'Bumble Bot',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: const SplashScreen(),
          ),
        ),
      ),
    );
  }
}
