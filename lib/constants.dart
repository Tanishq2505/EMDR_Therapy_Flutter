import 'package:flutter/material.dart';

enum AnimationType {
  GLIDE,
  FADE,
  BLINK,
}

final kButtonStyle = ButtonStyle(
  backgroundColor: MaterialStateProperty.all(Colors.white70),
  shape: MaterialStateProperty.all(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30),
    ),
  ),
);

const kTextStyle = TextStyle(
  color: Color(0xFF19318C),
);

const headingTextStyle = TextStyle(
  overflow: TextOverflow.visible,
);
