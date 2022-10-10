import 'package:flutter/material.dart';
import '../../../common/widgets/custom_TextField.dart';

class Step4 extends StatelessWidget {
  final TextEditingController productName;
  final String error;
  final TextEditingController landmark;
  final TextEditingController contactNumber;
  final TextEditingController location;
  final TextEditingController productPrice;
  final GlobalKey<FormState> step4FormKey;
  const Step4({
    Key? key,
    required this.contactNumber,
    required this.error,
    required this.landmark,
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
          CustomTextField(
            icons: Icons.abc,
            hinttext: 'Title',
            label: 'Product Name',
            error: error,
            controller: productName,
          ),
          CustomTextField(
            icons: Icons.place,
            hinttext: 'Street,City',
            label: 'Your Location',
            error: error,
            controller: location,
          ),
          CustomTextField(
            icons: Icons.location_city_outlined,
            hinttext: 'LandMark/Goverment Offices/Schools/Parks etc',
            label: 'Refernce Address/LandMarks',
            error: error,
            controller: landmark,
          ),
          CustomTextField(
            icons: Icons.contact_phone,
            hinttext: 'Phone Number',
            label: 'Contact Phone',
            error: error,
            controller: contactNumber,
          ),
          CustomTextField(
              controller: productPrice,
              hinttext: 'Expected Price',
              label: 'Product Price',
              icons: Icons.price_change,
              error: error),
        ],
      ),
    );
  }
}
