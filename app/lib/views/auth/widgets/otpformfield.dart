import 'package:app/constants/globalvariable.dart';
import 'package:app/utils/keyboard.dart';
import 'package:flutter/material.dart';

class OTPForm extends StatefulWidget {
  const OTPForm({super.key});

  @override
  State<OTPForm> createState() => _OTPFormState();
}

class _OTPFormState extends State<OTPForm> {
  FocusNode? pin1FocusNode;
  FocusNode? pin2FocusNode;
  FocusNode? pin3FocusNode;
  FocusNode? pin4FocusNode;
  String pin = '';
  @override
  void initState() {
    super.initState();

    pin1FocusNode = FocusNode();
    pin2FocusNode = FocusNode();
    pin3FocusNode = FocusNode();
    pin4FocusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    pin1FocusNode!.dispose();
    pin2FocusNode!.dispose();
    pin3FocusNode!.dispose();
    pin4FocusNode!.dispose();
  }

  void nextField(String value, FocusNode? focusNode) {
    pin = pin + value;
    if (value.length == 1 && focusNode != pin1FocusNode) {
      focusNode!.requestFocus();
    } else if (value.length == 1) {
      focusNode!.unfocus();
      KeyboardUtil.hideKeyboard(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: GlobalVariables.screenHeight * 0.15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            pinField(pin1FocusNode, pin2FocusNode),
            pinField(pin2FocusNode, pin3FocusNode),
            pinField(pin3FocusNode, pin4FocusNode),
            pinField(pin4FocusNode, pin1FocusNode),
          ],
        ),
        SizedBox(
          height: GlobalVariables.screenHeight * 0.15,
        ),
        SizedBox(
          width: double.infinity,
          height: getProportionateScreenHeight(56),
          child: TextButton(
            style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              backgroundColor: Colors.blue,
            ),
            onPressed: () {
              //checkopt

              Navigator.of(context).pushNamedAndRemoveUntil(
                  '/resetPassword-screen', (route) => false);
            },
            child: Text(
              'Continue',
              style: TextStyle(
                fontSize: getProportionateScreenWidth(18),
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }

  SizedBox pinField(
    FocusNode? pinFocusNode,
    FocusNode? nextFocusNode,
  ) {
    return SizedBox(
      width: getProportionateScreenWidth(60),
      child: TextFormField(
        focusNode: pinFocusNode,
        autofocus: false,
        style: const TextStyle(fontSize: 24),
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          contentPadding:
              EdgeInsets.symmetric(vertical: getProportionateScreenWidth(15)),
          border: OutlineInputBorder(
            borderRadius:
                BorderRadius.circular(getProportionateScreenWidth(15)),
            borderSide: BorderSide(color: Colors.grey.shade500),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius:
                BorderRadius.circular(getProportionateScreenWidth(15)),
            borderSide: BorderSide(color: Colors.grey.shade500),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius:
                BorderRadius.circular(getProportionateScreenWidth(15)),
            borderSide: BorderSide(color: Colors.grey.shade500),
          ),
        ),
        onChanged: ((value) {
          nextField(value, nextFocusNode);
        }),
      ),
    );
  }
}