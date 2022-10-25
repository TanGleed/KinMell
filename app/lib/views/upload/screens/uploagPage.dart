import 'package:app/constants/globalvariable.dart';
import 'package:app/views/home/screens/homepage.dart';
import 'package:app/views/upload/services/uploadModal.dart';
import 'package:app/views/upload/widgets/contactAddress._Form.dart';

import 'package:app/views/upload/widgets/productDetails_Form.dart';
import 'package:app/views/upload/widgets/productPricing_Filed.dart';
import 'package:app/views/upload/widgets/stepBar_box.dart';

import 'package:flutter/material.dart';
import 'package:im_stepper/stepper.dart';
import 'package:provider/provider.dart';

class UploadScreen extends StatefulWidget {
  static const String routeName = '/uploadpage-screen';
  const UploadScreen({super.key});

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  @override
  Widget build(BuildContext context) {
    GlobalVariables().init(context);
    return ChangeNotifierProvider(
      create: (context) => UploadModal(),
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Consumer<UploadModal>(builder: ((context, value, child) {
            return SlidingScreen();
          })),
        ),
      ),
    );
  }
}

class SlidingScreen extends StatelessWidget {
  SlidingScreen({super.key});
  List<Widget> pageList = [
    const ProductDetails(),
    const ContactAddressDetails(),
    const ProductPricingDetails(),
  ];
  @override
  Widget build(BuildContext context) {
    return Consumer<UploadModal>(builder: ((context, value, child) {
      return Column(
        children: [
          Padding(
            padding: EdgeInsets.only(right: getProportionateScreenWidth(400)),
            child: SizedBox(
                child: value.isStep1
                    ? IconButton(
                        onPressed: () {
                          Navigator.pushNamedAndRemoveUntil(
                              context, '/homepage-screen', (route) => false);
                        },
                        icon: const Icon(Icons.arrow_back_sharp))
                    : null),
          ),
          StepBarIndicator().buildBar(value),
          SizedBox(
            height: GlobalVariables.screenHeight * 0.85,
            child: Form(
              key: value.globalKeyState,
              child: PageView.builder(
                controller: value.pgcontroller,
                itemBuilder: ((context, index) {
                  print(value.productName);
                  return pageList[index];
                }),
                itemCount: value.totalSteps,
                onPageChanged: ((val) {
                  value.changesStep(val);
                }),
              ),
            ),
          ),
        ],
      );
    }));
  }
}
