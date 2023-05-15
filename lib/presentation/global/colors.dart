import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

var brightness =
    SchedulerBinding.instance.platformDispatcher.platformBrightness;
bool isDarkMode = brightness == Brightness.dark;

const Color cPremier = Color.fromARGB(255, 157, 60, 232);
const Color cSekunder = Color.fromARGB(255, 175, 71, 255);
const Color cTersier = Color.fromARGB(255, 255, 64, 217);
const Color cRed = Color.fromARGB(255, 255, 6, 95);
const Color cWhite = Color.fromARGB(255, 255, 255, 255);
const Color cBlack = Color.fromARGB(255, 0, 0, 0);
const Color cBlue = Color.fromARGB(255, 62, 152, 240);
const Color cYellow = Color.fromARGB(255, 255, 198, 0);
const Color cGray = Color.fromARGB(255, 173, 173, 173);
