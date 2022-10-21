import 'package:app/constants/globalvariable.dart';
import 'package:app/views/upload/widgets/inputtextField.dart';
import 'package:flutter/material.dart';
import '../../../common/widgets/custom_TextField.dart';

class Step4 extends StatelessWidget {
  final String? productName;

  final String? landMark;
  final String? contactNumber;
  final String? location;
  final String? productPrice;
  final GlobalKey<FormState> step4FormKey;
  const Step4({
    Key? key,
    required this.contactNumber,
    required this.landMark,
    required this.location,
    required this.productName,
    required this.productPrice,
    required this.step4FormKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: step4FormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          commonTextField(context, productName, 'Product Name', 'Product Name',
              Icons.abc, false, false),
          SizedBox(
            height: GlobalVariables.screenHeight * 0.01,
          ),
          commonTextField(context, location, 'Street,City', 'location',
              Icons.location_on, false, false),
          SizedBox(
            height: GlobalVariables.screenHeight * 0.01,
          ),
          commonTextField(
              context,
              landMark,
              'LandMark/Goverment Offices/Schools/Parks etc',
              'landmark',
              Icons.location_city_outlined,
              false,
              false),
          SizedBox(
            height: GlobalVariables.screenHeight * 0.01,
          ),
          commonTextField(context, contactNumber, 'Contact/Phone',
              'Contact Number', Icons.phone, false, true),
          SizedBox(
            height: GlobalVariables.screenHeight * 0.01,
          ),
          commonTextField(context, productPrice, 'Expected Price',
              'Product Price', Icons.monetization_on, false, false),
          SizedBox(
            height: GlobalVariables.screenHeight * 0.01,
          ),
        ],
      ),
    );
  }
}
