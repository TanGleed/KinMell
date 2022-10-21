import 'package:app/constants/globalvariable.dart';
import 'package:app/utils/keyboard.dart';
import 'package:app/views/auth/widgets/otpformfield.dart';
import 'package:app/views/auth/widgets/timeDisplay.dart';
import 'package:flutter/material.dart';

class OtpScreen extends StatefulWidget {
  static const String routeName = '/otp-screen';
  final String? email;
  const OtpScreen({
    required this.email,
    super.key,
  });

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  static bool showResendOTP = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: GlobalVariables.screenHeight * 0.05,
        ),
        Text(
          "Enter OTP",
          style: TextStyle(
            fontSize: getProportionateScreenWidth(28),
            fontWeight: FontWeight.bold,
            color: Colors.black,
            height: 1.5,
          ),
        ),
        Text(
          "OTP sent to ${widget.email} check inbox/spam folder ",
          textAlign: TextAlign.center,
        ),
        showtime(),
        const OTPForm(),
        SizedBox(
          height: GlobalVariables.screenHeight * 0.1,
        ),
        showResendOTP
            ? GestureDetector(
                onTap: () {},
                child: const Text(
                  'Resend OTP',
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              )
            : Container(),
      ],
    );
  }

  // bool validateAndSave() {
  Row showtime() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Resend OTP in '),
        TweenAnimationBuilder(
            tween: Tween(
              begin: 60.0,
              end: 0.0,
            ),
            onEnd: () {
              setState(() {
                showResendOTP = true;
                KeyboardUtil.hideKeyboard(context);
              });
            },
            duration: const Duration(seconds: 60),
            builder: (_, dynamic value, child) => Text("00:${value.toInt()}"))
      ],
    );
  }
}
