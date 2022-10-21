import 'package:app/views/home/widgets/textfield_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/FormHelper.dart';

Widget commonTextField(BuildContext context, String? value, String hintText,
    String key, IconData icons, bool isMultiline, bool isPhone) {
  return FormHelper.inputFieldWidget(
    context,
    key,
    hintText,
    (onValidate) {
      if (onValidate.isEmpty) return '*Required';

      return null;
    },
    (onSaved) {
      value = onSaved.toString().trim();
    },
    isNumeric: isPhone,
    showPrefixIcon: true,
    prefixIcon: Icon(icons),
    borderRadius: 10,
    contentPadding: 15,
    fontSize: 14,
    prefixIconPaddingLeft: 10,
    prefixIconColor: Colors.black,
    borderColor: Colors.grey.shade400,
    hintColor: Colors.black.withOpacity(0.6),
    backgroundColor: Colors.grey.shade100,
    borderFocusColor: Colors.grey.shade200,
    isMultiline: isMultiline,
    multilineRows: isMultiline ? 5 : 1,
    onChange: (val) {
      value = val;
    },
  );
}
