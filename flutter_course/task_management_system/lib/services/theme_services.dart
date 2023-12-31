import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';

class ThemeServices{
  final _box = GetStorage();
  final _key = 'isDarkMode';

  _saveThemeToBox(bool isDarkMode) => _box.write(_key, isDarkMode);


  bool _loadThemeFromBox() => _box.read(_key) ?? false;           //reading the value of the key if it exist return True else return false.

  ThemeMode get theme => _loadThemeFromBox() ? ThemeMode.dark : ThemeMode.light;

  void switchTheme(){
    Get.changeThemeMode(_loadThemeFromBox() ? ThemeMode.light : ThemeMode.dark) ;

    _saveThemeToBox(!_loadThemeFromBox());


  }

}