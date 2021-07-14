import 'package:flutter/material.dart';

class TextStyleCommon extends StatelessWidget {
  String textContent;
  font_name fontname;
  double size;
  color_type textColor;

  TextStyleCommon(
      {@required this.textContent,
      @required this.fontname,
      @required this.size,
      this.textColor = color_type.black});

  @override
  Widget build(BuildContext context) {
    return Text(textContent,
        style: TextStyle(
          fontWeight: FontName.getValue(fontname),
          fontSize: size,
          color: ColorType.getValue(textColor),
        ));
  }
}

enum color_type {
  orange,
  black,
  green,
  red,
  grey,
  lightOrange,
  blue,
  lightgreen,
  textorange,
  white,
  transperent,
  darkGray,
  lightPurple,
  purple
}

class ColorType {
  static Color getValue(color_type colors) {
    switch (colors) {
      case color_type.orange:
        return Color.fromRGBO(220, 98, 60, 1);
      case color_type.green:
        return Color.fromRGBO(82, 165, 85, 1);
      case color_type.red:
        return Color.fromRGBO(197, 52, 49, 1);
      case color_type.grey:
        return Color.fromRGBO(243, 243, 243, 1);
      case color_type.lightOrange:
        return Color.fromRGBO(248, 223, 215, 1);
      case color_type.blue:
        return Color.fromRGBO(244, 247, 249, 1);
      case color_type.lightgreen:
        return Color.fromRGBO(246, 254, 232, 1);
      case color_type.textorange:
        return Color.fromRGBO(234, 174, 84, 1);
      case color_type.purple:
        return Color.fromRGBO(227, 209, 251, 1);
      case color_type.lightPurple:
        return Color.fromRGBO(245, 239, 251, 1);
      case color_type.white:
        return Colors.white;
      case color_type.transperent:
        return Colors.transparent;
      case color_type.darkGray:
        return Color.fromRGBO(171, 171, 171, 1);
      default:
        return Colors.black;
    }
  }
}

enum font_name { normal, light, semibold, medium }

class FontName {
  static FontWeight getValue(font_name fonts) {
    switch (fonts) {
      case font_name.normal:
        return FontWeight.normal;
      case font_name.light:
        return FontWeight.w300;
      case font_name.semibold:
        return FontWeight.w600;
      case font_name.medium:
        return FontWeight.w500;
      default:
        return FontWeight.normal;
    }
  }
}

BoxDecoration containerRounded({double radius, color_type color}) {
  return BoxDecoration(
      borderRadius: BorderRadius.all(
        Radius.circular(radius ?? 20.0),
      ),
      color: ColorType.getValue(color ?? color_type.blue));
}
