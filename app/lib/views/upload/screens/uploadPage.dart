import 'package:app/constants/utils.dart';
import 'package:app/views/upload/widgets/Step1.dart';
import 'package:app/views/upload/widgets/Step2.dart';
import 'package:app/views/upload/widgets/Step3.dart';
import 'package:app/views/upload/widgets/Step4.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

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

//Image Files
  final ImagePicker imagePicker = ImagePicker();
  List<XFile>? images = [];

//Form Key
  final _addProductFormKey = GlobalKey<FormState>();

//Radiobutton

  @override
  void dispose() {
    productName.dispose();
    productDescription.dispose();
    location.dispose();
    contactNumber.dispose();
    landmark.dispose();
    super.dispose();
  }

  void selectImages() async {
    final List<XFile>? selectedimage = await imagePicker.pickMultiImage();
    if (selectedimage!.isEmpty) {
      images!.addAll(selectedimage);
    }
  }

  movetoHomepage() {
    Navigator.of(context)
        .pushNamedAndRemoveUntil(HomePage.routeName, (route) => false);
  }

  void moveStep() {
    if (currentStep == getSteps().length - 1) {
      if (_addProductFormKey.currentState!.validate()) {
        showSnackBar(context, 'Product Uploaded');
        movetoHomepage();
      } else {
        showSnackBar(context, 'Please Fill The Form Completely');
      }
    } else {
      setState(() {
        currentStep += 1;
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
              productDescription: productDescription)),
      Step(
          state: _buildState(1),
          isActive: currentStep >= 1,
          title: const Text('Contact Address'),
          content: Step2(
              landmark: landmark,
              location: location,
              contactNumber: contactNumber,
              error: error)),
      Step(
        state: _buildState(2),
        isActive: currentStep >= 2,
        title: const Text('Pricing'),
        content: Step3(error: error, productPrice: productPrice),
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
              productPrice: productPrice)),
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
        child: Form(
          key: _addProductFormKey,
          autovalidateMode: AutovalidateMode.disabled,
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
      ),
    );
  }
}
