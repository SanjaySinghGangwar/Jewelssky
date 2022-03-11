import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jewelssky/Utils/mUtils.dart';

class Widgets {
  static mCard(String data) {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: InkWell(child: Text(data)),
    );
  }

  static Widget mTextFild(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 20,
      ),
    );
  }

  static mImageView(String assest) {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: InkWell(
          child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Image.asset(assest),
      )),
    );
  }

  static mDivider() {
    return Column(
      children: [
        const SizedBox(
          height: 12,
        ),
        Divider(
          color: mUtis.backgroundColorr,
        ),
        const SizedBox(
          height: 12,
        ),
      ],
    );
  }
}
