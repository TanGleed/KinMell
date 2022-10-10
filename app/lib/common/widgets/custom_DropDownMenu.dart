import 'package:flutter/material.dart';

class CustomDropDownMenu extends StatefulWidget {
  final items;
  final String label;
  const CustomDropDownMenu({
    Key? key,
    required this.label,
    required this.items,
  }) : super(key: key);

  @override
  State<CustomDropDownMenu> createState() => _CustomDropDownMenuState();
}

class _CustomDropDownMenuState extends State<CustomDropDownMenu> {
  String? value;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        widget.label,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      title: _buildDropDownMenu(),
    );
  }

  //Drop Down Menu Function;
  DropdownButton _buildDropDownMenu() {
    final items = widget.items;
    return DropdownButton<String>(
      value: value,
      focusColor: Colors.blueAccent,
      dropdownColor: const Color.fromARGB(255, 240, 240, 240),
      borderRadius: BorderRadius.circular(20),
      style: const TextStyle(
        color: Colors.black,
      ),
      icon: const Icon(Icons.keyboard_arrow_down),
      items: items.map<DropdownMenuItem<String>>(buildMenuItem).toList(),
      onChanged: (String? value) => setState(() {
        this.value = value;
      }),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) {
    return DropdownMenuItem(
      value: item,
      child: Text(
        item,
      ),
    );
  }
}
