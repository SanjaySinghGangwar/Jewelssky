import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class mUtis {
  final String appName = "Jewelssky";
  final String BaseURL = 'https://www.jewelssky.com/Api/';
  final Color backgroundColor = Color.fromRGBO(66, 103, 178, 1.0);
  static Color backgroundColorr = Color(0xff4267b2);

  final Color white = Color.fromRGBO(255, 255, 255, 1.0);
  final Color black = Color.fromRGBO(0, 0, 0, 1.0);

  static mToast(String message) {
    Fluttertoast.showToast(msg: message, toastLength: Toast.LENGTH_LONG, gravity: ToastGravity.BOTTOM, timeInSecForIosWeb: 1, backgroundColor: backgroundColorr, textColor: Colors.white, fontSize: 16.0);
  }

  static mToastSuccess(String message) {
    Fluttertoast.showToast(msg: message, toastLength: Toast.LENGTH_LONG, gravity: ToastGravity.BOTTOM, timeInSecForIosWeb: 1, backgroundColor: Colors.green, textColor: Colors.white, fontSize: 16.0);
  }

  static mToastError(String message) {
    Fluttertoast.showToast(msg: message, toastLength: Toast.LENGTH_LONG, gravity: ToastGravity.BOTTOM, timeInSecForIosWeb: 1, backgroundColor: Colors.redAccent, textColor: Colors.white, fontSize: 16.0);
  }

  /*Navigator.of(context).pop(true),*/

}
