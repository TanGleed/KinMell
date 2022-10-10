import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onpressed;
  const CustomButton({Key? key, required this.text, required this.onpressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(text),
      onPressed: onpressed,
      style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 50)),
    );
  }
}
