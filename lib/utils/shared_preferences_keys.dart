import 'package:flutter/material.dart';


import 'package:hotels_booking_app/utils/themes.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'enum.dart';

class SharedPreferencesKeys {
  _setIntData({required String key, required int id}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(key, id);
  }

  Future<int?> _getIntData({required String key}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(key);
  }

  Future<ThemeModeType> getThemeMode() async {
    int? index = await _getIntData(key: 'ThemeModeType');
    if (index != null) {
      return ThemeModeType.values[index];
    } else {
      return ThemeModeType.system;
    }
  }

  Future setThemeMode(ThemeModeType type) async {
    await _setIntData(key: 'ThemeModeType', id: type.index);
  }

  Future<FontFamilyType> getFontType() async {
    int? index = await _getIntData(key: 'FontType');
    if (index != null) {
      return FontFamilyType.values[index];
    } else {
      return FontFamilyType.WorkSans; // Default we set work span font
    }
  }

  Future setFontType(FontFamilyType type) async {
    await _setIntData(key: 'FontType', id: type.index);
  }

  Future<ColorType> getColorType() async {
    int? index = await _getIntData(key: 'ColorType');
    if (index != null) {
      return ColorType.values[index];
    } else {
      return ColorType.Verdigris; // Default we set Verdigris
    }
  }

  Future setColorType(ColorType type) async {
    await _setIntData(key: 'ColorType', id: type.index);
  }

  // Future<LanguageType> getLanguageType() async {
  //   int? index = await _getIntData(key: 'Languagetype');
  //   if (index != null) {
  //     return LanguageType.values[index];
  //   } else {
  //     if (applicationcontext != null) {
  //       LanguageType type = LanguageType.en;
  //       final Locale myLocale = Localizations.localeOf(applicationcontext!);
  //       if (myLocale.languageCode != '' && myLocale.languageCode.length == 2) {
  //         for (var item in LanguageType.values.toList()) {
  //           if (myLocale.languageCode == item.toString().split(".")[1]) {
  //             type = item;
  //           }
  //         }
  //       }
  //       return type;
  //     } else {
  //       return LanguageType.en; // Default we set english
  //     }
  //   }
  // }

  Future setLanguageType(LanguageType language) async {
    await _setIntData(key: 'Languagetype', id: language.index);
  }
}