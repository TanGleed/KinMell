import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/FormHelper.dart';

Widget commonDropDownMenu(
  BuildContext context,
  String? hintext,
  String? value,
  List<dynamic> lst,
  IconData icons,
) {
  return FormHelper.dropDownWidget(
    context,
    'Product Type',
    value,
    lst,
    (onValidate) {
      if (!onValidate.isEmpty) {
        return '*Required';
      }
      return '*Required';
    },
    (onChanged) {
      value = onChanged.toString().trim();
    },
    showPrefixIcon: true,
    prefixIcon: Icon(icons),
    prefixIconPaddingLeft: 10,
    prefixIconColor: Colors.black,
    borderRadius: 10,
    hintFontSize: 14,
    hintColor: Colors.black.withOpacity(0.6),
    contentPadding: 15,
    borderColor: Colors.grey.shade400,
    borderFocusColor: Colors.grey.shade200,
    optionValue: "val",
    optionLabel: "label",
  );
}
