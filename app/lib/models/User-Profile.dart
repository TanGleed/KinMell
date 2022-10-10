import 'package:flutter/cupertino.dart';

class User_Profile{
  final String imgPath;
  final String name;
  final String email;
  final String about;
  final bool isDarkMode;

  const User_Profile({
  required this.imgPath,
  required this.name,
  required this.email,
  required this.about,
  required this.isDarkMode,
});
}

