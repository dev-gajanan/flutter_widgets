// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'package:flutter/material.dart';
import 'dart:ui';

class SnackbarColor {
  static const Color info = Color(0xff3282B8);
  static const Color error = Color(0xffc72c41);
  static const Color success = Color(0xff2D6A4F);
  static const Color warning = Color(0xffFCA652);
}


class SnackBarType {
  final String message;
  final Color? color;

  SnackBarType(this.message, [this.color]);

  static SnackBarType info = SnackBarType('info', SnackbarColor.info);
  static SnackBarType error = SnackBarType('error', SnackbarColor.error);
  static SnackBarType success = SnackBarType('success', SnackbarColor.success);
  static SnackBarType warning = SnackBarType('warning', SnackbarColor.warning);
}

class AppSnackBar extends StatelessWidget {
  AppSnackBar({ 
    Key? key, 
    required this.message, 
    required this.snackbarType,  
    required this.title,
    this.color
  }) : super(key: key);

  final String message;
  final SnackBarType snackbarType;
  final String title;
  final Color? color;
  
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.05,
        vertical: size.height * 0.025,
      ),
      height: size.height * 0.125,
      decoration: BoxDecoration(
        color: color ?? snackbarType.color,
        borderRadius: BorderRadius.all(Radius.circular(16.0))
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title, 
            style: TextStyle(
              color: Colors.white,
              fontSize: 14.0
            )
          ),
         Spacer(),
          Text(
            message,
            style: TextStyle(color: Colors.white),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          )
        ],
      )
    );  
  }
}