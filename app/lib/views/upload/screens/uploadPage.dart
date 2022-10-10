import 'package:app/config/config.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:app/views/upload/widgets/Step1.dart';
import 'package:app/views/upload/widgets/Step2.dart';
import 'package:app/views/upload/widgets/Step3.dart';
import 'package:app/views/upload/widgets/Step4.dart';
import 'package:flutter/material.dart';

import '../../home/screens/homepage.dart';

enum Pricingtype { Negotiable, Non_Negotiable }

class UploadPage extends StatefulWidget {
  static const String routeName = '/upload-screen';
  const UploadPage({Key? key}) : super(key: key);

  @override
  State<UploadPage> createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
//StepCounter
  int currentStep = 0;

//TextEditing Controllers
  final TextEditingController location = TextEditingController();
  final TextEditingController contactNumber = TextEditingController();
  final TextEditingController landmark = TextEditingController();
  final TextEditingController productName = TextEditingController();
  final TextEditingController productDescription = TextEditingController();
  final TextEditingController productPrice = TextEditingController();
//Error
  String error = 'is Mandatory';

//Form Key
  final step1FormKey = GlobalKey<FormState>();
  final step2FormKey = GlobalKey<FormState>();
  final step3FormKey = GlobalKey<FormState>();
  final step4FormKey = GlobalKey<FormState>();
//
  List<dynamic> productType = [];
  List<dynamic> productCondition = [];

//Radiobutton
  @override
  void initState() {
    // TODO: implement initState
    productType.add({"val": "1", "label": "Electronics"});
    productType.add({"val": "2", "label": "Notes"});

    productCondition.add({"val": "1", "label": "New"});
    productCondition.add({"val": "2", "label": "Used"});
    productCondition.add({"val": "2", "label": "Damaged(Can be Repaired)"});
    super.initState();
  }

  @override
  void dispose() {
    productName.dispose();
    productDescription.dispose();
    location.dispose();
    contactNumber.dispose();
    landmark.dispose();

    super.dispose();
  }

  movetoHomepage() {
    Navigator.of(context)
        .pushNamedAndRemoveUntil(HomePage.routeName, (route) => false);
  }

  void moveStep() {
    if (currentStep == getSteps().length - 1 && validate()) {
      FormHelper.showSimpleAlertDialog(
        context,
        Config.appName,
        "Product Uploaded SuccessFully",
        "Ok",
        () {
          Navigator.of(context).pop();
          Navigator.pushNamedAndRemoveUntil(
            context,
            HomePage.routeName,
            (route) => false,
          );
        },
      );
    } else if (validate()) {
      setState(() {
        currentStep += 1;
      });
    } else {
      FormHelper.showSimpleAlertDialog(
          context, 'KinMell', 'Fill Required Fileds', 'OK', () {
        Navigator.of(context).pop();
      });
    }
  }

  List<Step> getSteps() {
    return [
      Step(
          state: _buildState(0),
          title: const Text('Product Details'),
          isActive: currentStep >= 0,
          content: Step1(
            error: error,
            productName: productName,
            productDescription: productDescription,
            step1FormKey: step1FormKey,
            productType: productType,
            productCondition: productCondition,
          )),
      Step(
          state: _buildState(1),
          isActive: currentStep >= 1,
          title: const Text('Contact Address'),
          content: Step2(
            landmark: landmark,
            location: location,
            contactNumber: contactNumber,
            error: error,
            step2FormKey: step2FormKey,
          )),
      Step(
        state: _buildState(2),
        isActive: currentStep >= 2,
        title: const Text('Pricing'),
        content: Step3(
          error: error,
          productPrice: productPrice,
          step3FormKey: step3FormKey,
        ),
      ),
      Step(
          state: _buildState(3),
          isActive: currentStep >= 3,
          title: const Text('Editing And Confirmation'),
          content: Step4(
            contactNumber: contactNumber,
            error: error,
            landmark: landmark,
            location: location,
            productName: productName,
            productPrice: productPrice,
            step4FormKey: step4FormKey,
          )),
    ];
  }

  StepState _buildState(int index) {
    return (currentStep == index
        ? StepState.editing
        : currentStep > index
            ? StepState.complete
            : StepState.indexed);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Upload Products',
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ),
        //backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        leading: BackButton(onPressed: () => movetoHomepage()),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stepper(
              type: StepperType.vertical,
              steps: getSteps(),
              onStepCancel: () {
                if (currentStep == 0) {
                  movetoHomepage();
                } else {
                  setState(() {
                    currentStep -= 1;
                  });
                }
              },
              currentStep: currentStep,
              onStepContinue: moveStep,
            ),
          ],
        ),
      ),
    );
  }

  bool validate() {
    switch (currentStep) {
      case 0:
        if (step1FormKey.currentState!.validate()) {
          return true;
        } else {
          return false;
        }
      case 1:
        if (step2FormKey.currentState!.validate()) {
          return true;
        } else {
          return false;
        }
      case 2:
        if (step3FormKey.currentState!.validate()) {
          return true;
        } else {
          return false;
        }
      case 3:
        if (step4FormKey.currentState!.validate()) {
          return true;
        } else {
          return false;
        }
      default:
        return false;
    }
  }
}
