import 'package:flutter/material.dart';

const Color cGood = Color.fromARGB(255, 27, 248, 19);
const Color cMediumRisk = Color.fromARGB(255, 198, 201, 3);
const Color cbad = Color.fromARGB(255, 173, 52, 0);
const Color cUnknow = Color.fromARGB(255, 4, 1, 0);

List listReputation = [
  {"name": "Good", 'color': cGood},
  {"name": "Medium Risk", 'color': cMediumRisk},
  {"name": "Bad", 'color': cbad},
  {"name": "Unknow", 'color': cUnknow},
];

convertReputation(String reputation) {
  if (reputation == '0') {
    return cUnknow;
  } else if (reputation == '1') {
    return cbad;
  } else if (reputation == '2') {
    return cMediumRisk;
  } else if (reputation == '3') {
    return cGood;
  }
}
