import 'package:flutter/material.dart';

sHeightDynamic(BuildContext context, dynamic value) {
  return MediaQuery.of(context).size.height * value;
}

sHeightFull(BuildContext context) {
  return MediaQuery.of(context).size.height -
      MediaQuery.of(context).viewPadding.top;
}

sHeightScreen(BuildContext context) {
  return MediaQuery.of(context).size.height -
      MediaQuery.of(context).viewPadding.top -
      55;
}

sHeightScreenComments(BuildContext context) {
  return MediaQuery.of(context).size.height -
      MediaQuery.of(context).viewPadding.top;
}

sHeightBarNavigation(BuildContext context) {
  return 55.0;
}

sHeightBackButton(BuildContext context) {
  return 60.0;
}

sHeightInputComments(BuildContext context) {
  return 80.0;
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

sPaddingBottom(BuildContext context) {
  return Padding(
    padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
  );
}
