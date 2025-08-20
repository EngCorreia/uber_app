import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ColorsCore {
  static Color primaryColor = const Color(0xFF19812F);

  //static  Color secondaryColor = Color(int.parse(dotenv.env['SECONDARY_COLOR']!));

  //static  Color tertiaryColor = Color(int.parse(dotenv.env['TERCIARY_COLOR']!));

  //static  Color quaternaryColor = Color(int.parse(dotenv.env['COLOR']!));

  static Color scaffoldColor = Color(int.parse(dotenv.env['SCAFFOLD_COLOR']!));

  static Color colorBorder = Color(int.parse(dotenv.env['BORDER_COLOR']!));

  static Color colorWhite = Color(int.parse(dotenv.env['WHITE_COLOR']!));
}
