import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hinttext;
  final String label;
  final bool isPassword;
  final IconData icons;
  final String error;
  const CustomTextField({
    Key? key,
    required this.controller,
    required this.hinttext,
    required this.label,
    required this.isPassword,
    required this.icons,
    required this.error,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(
        prefixIcon: Icon(
          icons,
          color: Colors.grey,
        ),
        hintText: hinttext,
        labelText: label,
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return '$label $error';
        }
        return null;
      },
    );
  }
}

// TextFormField buildTextField(
//   IconData icons,
//   String hinttext,
//   String label,
//   String error,
//   bool isPassword,
//   TextEditingController controller,
//   String credentials,
// ) {}
