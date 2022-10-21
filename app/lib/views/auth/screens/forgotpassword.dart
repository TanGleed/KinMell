import 'dart:ffi';

import 'package:app/api/api_service.dart';
import 'package:app/constants/globalvariable.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/FormHelper.dart';

import '../../../config/config.dart';

class ForgotPasswordScreen extends StatefulWidget {
  static const String routeName = '/forgotpassword-screen';
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  static bool isValidEmail = false;
  static final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  String? email;
  @override
  Widget build(BuildContext context) {
    GlobalVariables().init(context);
    return Scaffold(
      appBar: AppBar(),
      body: Form(key: globalKey, child: Body()),
    );
  }

  SizedBox Body() {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              Text(
                "Forgot Password",
                style: TextStyle(
                    fontSize: getProportionateScreenWidth(27),
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              const Text(
                "Please enter your email and we will send \nyou a link",
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: GlobalVariables.screenHeight * 0.05,
              ),
              isValidEmail ? emailValidFormField() : emailFormField(),
              SizedBox(
                height: GlobalVariables.screenHeight * 0.01,
              ),
              Center(
                child: FormHelper.submitButton("Send Link", () {
                  if (validateAndSave()) {
                    // API
                    setState(() {
                      isValidEmail = false;
                    });

                    if (true) {
                      FormHelper.showSimpleAlertDialog(
                          context,
                          Config.appName,
                          "Please follow the link sent to your mail to reset password.And return to the app",
                          'OK', () {
                        Navigator.pushNamedAndRemoveUntil(
                            context, '/login-screen', (route) => false);
                      });
                    } else {
                      FormHelper.showSimpleAlertDialog(
                          context, Config.appName, "Invalid email", 'OK', () {
                        Navigator.pop(context);
                      });
                    }
                  }
                },
                    btnColor: Colors.deepPurple,
                    borderColor: Colors.white,
                    borderRadius: 20,
                    txtColor: Colors.white),
              ),
              SizedBox(
                height: GlobalVariables.screenHeight * 0.01,
              ),
              Center(
                child: RichText(
                  text: TextSpan(
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                    children: <TextSpan>[
                      const TextSpan(text: "Don't have an account? "),
                      TextSpan(
                          text: "SignUp",
                          style: const TextStyle(
                            color: Colors.purple,
                            fontWeight: FontWeight.bold,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                '/register-screen',
                                (route) => false,
                              );
                            }),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container emailFormField() {
    return Container(
      child: FormHelper.inputFieldWidget(
        context,
        'email',
        'Email',
        (onValidate) {
          if (onValidate.isEmpty) {
            return '* Required';
          }
          bool emailValid = RegExp(
                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
              .hasMatch(onValidate);
          if (!emailValid) {
            return "Invalid Email";
          }

          return null;
        },
        (onSaved) {
          email = onSaved.toString().trim();
        },
        showPrefixIcon: true,
        prefixIcon: const Icon(Icons.email_outlined),
        borderRadius: 10,
        contentPadding: 15,
        fontSize: 14,
        prefixIconPaddingLeft: 10,
        prefixIconColor: Colors.black,
        borderColor: Colors.grey.shade400,
        hintColor: Colors.black.withOpacity(0.6),
        backgroundColor: Colors.grey.shade100,
        borderFocusColor: Colors.grey.shade200,
      ),
    );
  }

  Container emailValidFormField() {
    return Container();
  }

  bool validateAndSave() {
    final form = globalKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }
}