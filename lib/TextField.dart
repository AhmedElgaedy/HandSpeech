import 'package:flutter/material.dart';

Widget textfield({
  BuildContext context,
  String hint,
  Icon icon,
}) {
  return TextField(
    cursorColor: Colors.white,
    textAlign: TextAlign.right,
    textDirection: TextDirection.rtl,
    decoration: new InputDecoration(
      border: InputBorder.none,
      focusedBorder: InputBorder.none,
      enabledBorder: InputBorder.none,
      errorBorder: InputBorder.none,
      disabledBorder: InputBorder.none,
      contentPadding: EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
      hintText: hint,
      hintStyle: TextStyle(color: Color(0xFF6E3103), fontSize: 12),
      suffixIcon: icon,
    ),
  );
}
