import 'package:flutter/material.dart';

alertDynamic(context, String title, String body) {
  showDialog<String>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: Text(title),
      content: Text(body),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, 'Cancel'),
          child: const Text('Tutup'),
        ),
      ],
    ),
  );
}
