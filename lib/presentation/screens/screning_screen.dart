import 'package:flutter/material.dart';

class ScreningScreen extends StatefulWidget {
  const ScreningScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ScreningScreen> createState() => _ScreningScreenState();
}

class _ScreningScreenState extends State<ScreningScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Text('screning')),
    );
  }
}
