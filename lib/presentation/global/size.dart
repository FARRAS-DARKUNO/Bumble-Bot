import 'package:flutter/material.dart';

sHeightDynamic(BuildContext context, dynamic value) {
  return MediaQuery.of(context).size.height * value;
}

sHeightFull(BuildContext context) {
  return MediaQuery.of(context).size.height -
      MediaQuery.of(context).viewPadding.top;
}

sWidthDynamic(BuildContext context, dynamic value) {
  return MediaQuery.of(context).size.width * value;
}

sWidthFull(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

sKeyboard(BuildContext context) {
  return MediaQuery.of(context).viewInsets.bottom;
}
