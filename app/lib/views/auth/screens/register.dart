import 'package:app/api/api_service.dart';
import 'package:app/views/auth/screens/login.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';
import 'package:app/config/config.dart';

import '../../../models/auth/signup_request_model.dart';

class RegisterPage extends StatefulWidget {
  static const String routeName = '/register-screen';
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  static final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  bool isAsyncCallProcess = false;

  String? name;
  String? password;
  String? confirmPassword;
  String? email;
  bool hidePassword = true;
  bool hideConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ProgressHUD(
          inAsyncCall: isAsyncCallProcess,
          opacity: .3,
          key: UniqueKey(),
          child: Form(
            key: globalKey,
            child: _registerUI(context),
          ),
        ),
      ),
    );
  }

  Widget _registerUI(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.center,
                child: Image.asset(
                  'assets/images/kinmell.png',
                  fit: BoxFit.fitWidth,
                  width: 150,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "K i n M e l l",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 35,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
          const Center(
            child: Text(
              "Sign Up",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.purple),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          FormHelper.inputFieldWidget(
            context,
            "name",
            "Full Name",
            (onValidateVal) {
              if (onValidateVal.isEmpty) return "* Required";

              return null;
            },
            (onSavedVal) {
              name = onSavedVal.toString().trim();
            },
            showPrefixIcon: true,
            prefixIcon: const Icon(Icons.face),
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
          const SizedBox(
            height: 10,
          ),
          FormHelper.inputFieldWidget(
            context,
            "email",
            "Email",
            (onValidateVal) {
              if (onValidateVal.isEmpty) return "* Required";

              bool emailValid = RegExp(
                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                  .hasMatch(onValidateVal);
              if (!emailValid) {
                return "Invalid Email";
              }

              return null;
            },
            (onSavedVal) {
              email = onSavedVal.toString().trim();
            },
            showPrefixIcon: true,
            prefixIcon: const Icon(Icons.email),
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
          const SizedBox(
            height: 10,
          ),
          FormHelper.inputFieldWidget(
            context,
            "password",
            "Password",
            (onValidateVal) {
              if (onValidateVal.isEmpty) return "* Required";

              return null;
            },
            (onSavedVal) {
              password = onSavedVal.toString().trim();
            },
            showPrefixIcon: true,
            prefixIcon: const Icon(Icons.password),
            borderRadius: 10,
            contentPadding: 15,
            fontSize: 14,
            prefixIconPaddingLeft: 10,
            prefixIconColor: Colors.black,
            borderColor: Colors.grey.shade400,
            hintColor: Colors.black.withOpacity(0.6),
            backgroundColor: Colors.grey.shade100,
            borderFocusColor: Colors.grey.shade200,
            obscureText: hidePassword,
            suffixIcon: IconButton(
              onPressed: () {
                setState(
                  () {
                    hidePassword = !hidePassword;
                  },
                );
              },
              color: Colors.purple.withOpacity(.4),
              icon: Icon(
                hidePassword ? Icons.visibility_off : Icons.visibility,
              ),
            ),
            onChange: (val) {
              password = val;
            },
          ),
          const SizedBox(
            height: 10,
          ),
          FormHelper.inputFieldWidget(
            context,
            "confirmPassword",
            "Confirm Password",
            (onValidateVal) {
              if (onValidateVal.isEmpty) return "* Required";

              if (onValidateVal != password) {
                return "Confirm Password not matched";
              }

              return null;
            },
            (onSavedVal) {
              confirmPassword = onSavedVal.toString().trim();
            },
            showPrefixIcon: true,
            prefixIcon: const Icon(Icons.password),
            borderRadius: 10,
            contentPadding: 15,
            fontSize: 14,
            prefixIconPaddingLeft: 10,
            prefixIconColor: Colors.black,
            borderColor: Colors.grey.shade400,
            hintColor: Colors.black.withOpacity(0.6),
            backgroundColor: Colors.grey.shade100,
            borderFocusColor: Colors.grey.shade200,
            obscureText: hideConfirmPassword,
            suffixIcon: IconButton(
              onPressed: () {
                setState(
                  () {
                    hideConfirmPassword = !hideConfirmPassword;
                  },
                );
              },
              color: Colors.purple.withOpacity(.4),
              icon: Icon(
                hideConfirmPassword ? Icons.visibility_off : Icons.visibility,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: FormHelper.submitButton(
              "Sign Up",
              () {
                if (validateAndSave()) {
                  // API
                  setState(() {
                    isAsyncCallProcess = true;
                  });

                  SignupRequestModel model = SignupRequestModel(
                    name: name!,
                    email: email!,
                    password: password!,
                  );

                  APIService.signup(model).then(
                    (response) {
                      if (response.user != null) {
                        FormHelper.showSimpleAlertDialog(
                            context,
                            Config.appName,
                            "Registration Successful",
                            'OK', () {
                          Navigator.pushNamedAndRemoveUntil(
                              context, '/login', (route) => false);
                        });
                      } else {
                        FormHelper.showSimpleAlertDialog(
                            context, Config.appName, response.message, 'OK',
                            () {
                          Navigator.pop(context);
                        });
                      }
                    },
                  );
                }
              },
              btnColor: Colors.deepPurple,
              borderColor: Colors.white,
              txtColor: Colors.white,
              borderRadius: 20,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: RichText(
              text: TextSpan(
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                ),
                children: <TextSpan>[
                  const TextSpan(text: "Already have an account? "),
                  TextSpan(
                    text: "Login",
                    style: const TextStyle(
                      color: Colors.purple,
                      fontWeight: FontWeight.bold,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                          LoginPage.routeName,
                          (route) => false,
                        );
                      },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
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
