import 'package:app_demo_gemini/config/theme/app_style.dart';
import 'package:flutter/material.dart';

class AppTheme {
  final bool isDarkmode;

  AppTheme({this.isDarkmode = true});
  OutlineInputBorder _borderInput({Color color = Colors.grey}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: color),
    );
  }

  ThemeData getTheme() => ThemeData(
        useMaterial3: true,
        colorSchemeSeed: AppStyle.primaryColor,
        brightness: isDarkmode ? Brightness.dark : Brightness.light,
        listTileTheme: const ListTileThemeData(
          iconColor: AppStyle.primaryColor,
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: InputBorder.none,
          contentPadding: const EdgeInsets.all(9),
          fillColor: AppStyle.cardColor,
          filled: true,
          hintStyle: const TextStyle(fontWeight: FontWeight.w300),
          enabledBorder: _borderInput(),
          focusedErrorBorder: _borderInput(),
          focusedBorder: _borderInput(),
          errorBorder: _borderInput(color: Colors.red),
        ),
      );
}
