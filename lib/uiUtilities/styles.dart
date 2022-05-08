import 'colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

//Font 400 - Regular
//Font 500 - Medium
//Font 600 - SemiBold
//Font 700 - Bold

const headline1 = TextStyle(
  fontFamily: 'Poppins',
  fontSize: 18,
  color: textBlack,
  fontWeight: FontWeight.w600,
);

const subTitle = TextStyle(
  fontFamily: 'Poppins',
  fontSize: 16,
  color: textSubGrey,
  fontWeight: FontWeight.w500,
);

const bodyText = TextStyle(
  fontFamily: 'Poppins',
  fontSize: 14,
  color: textSubGrey,
  fontWeight: FontWeight.w500,
);

const regular = TextStyle(
  fontFamily: 'Poppins',
  fontSize: 16,
  color: textBlack,
  fontWeight: FontWeight.w400,
);

const commentStyle = TextStyle(
  fontFamily: 'Poppins',
  fontSize: 12,
  color: textBlack,
  fontStyle: FontStyle.italic,
  fontWeight: FontWeight.w400,
);

final ButtonStyle elevatedButtonStyle = ElevatedButton.styleFrom().copyWith(
  backgroundColor: MaterialStateProperty.resolveWith<Color>(
    (Set<MaterialState> states) {
      if (states.contains(MaterialState.disabled)) return Colors.grey;
      return bgMainBlue; // Defer to the widget's default.
    },
  ),
);

final ButtonStyle outlineButtonStyle = OutlinedButton.styleFrom().copyWith(
  side: MaterialStateProperty.resolveWith<BorderSide>(
    (Set<MaterialState> states) {
      if (states.contains(MaterialState.pressed))
        return BorderSide(
          color: bgMainBlue,
          width: 1,
        );
      return BorderSide(color: bgMainBlue);
    },
  ),
);

final OutlineInputBorder normalBorder = const OutlineInputBorder(
  borderRadius: BorderRadius.all(
    Radius.circular(10),
  ),
  borderSide: BorderSide(color: Colors.transparent, width: 1),
);

final borderForBottomSheet = RoundedRectangleBorder(
  borderRadius: BorderRadius.only(
    topRight: Radius.circular(12),
    topLeft: Radius.circular(12),
  ),
);
