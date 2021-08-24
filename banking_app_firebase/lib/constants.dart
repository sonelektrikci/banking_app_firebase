import 'package:flutter/material.dart';

const kTextFieldDecoration = InputDecoration(
  hintText: "Enter a value",
  contentPadding: EdgeInsets.symmetric(
    vertical: 10,
    horizontal: 20,
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32)),
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(32),
    ),
    borderSide: BorderSide(
      color: Colors.black,
      width: 1,
    ),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.black,
      width: 1,
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(32),
    ),
  ),
);

const kInfoTextDecoration = TextStyle(
  color: Colors.black,
  fontSize: 20,
  fontWeight: FontWeight.bold,
);
