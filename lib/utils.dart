import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Utils {
  static const Color mainColor = Color(0xFF151C26);
  static const Color firstColor = Color(0xFFF4C10F);
  static const Color secondColor = Color(0xFF5A606B);

  static String formatDateTimeCreatedAt(String str){
    return DateFormat.yMMMMd().format(DateTime.parse(str));
  }

  static String displayGenderForCast(int value){
    return value == 1 ? 'Female' : 'Male';
  }
}
