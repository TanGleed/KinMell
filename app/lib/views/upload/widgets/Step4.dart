import 'package:flutter/material.dart';
import '../../../common/widgets/custom_TextField.dart';

class Step4 extends StatelessWidget {
  final TextEditingController productName;
  final String error;
  final TextEditingController landmark;
  final TextEditingController contactNumber;
  final TextEditingController location;
  final TextEditingController productPrice;
  const Step4({
    Key? key,
    required this.contactNumber,
    required this.error,
    required this.landmark,
    required this.location,
    required this.productName,
    required this.productPrice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextField(
          icons: Icons.abc,
          hinttext: 'Title',
          label: 'Product Name',
          error: error,
          controller: productName,
          isPassword: false,
        ),
        CustomTextField(
          icons: Icons.place,
          hinttext: 'Street,City',
          label: 'Your Location',
          error: error,
          controller: location,
          isPassword: false,
        ),
        CustomTextField(
          icons: Icons.location_city_outlined,
          hinttext: 'LandMark/Goverment Offices/Schools/Parks etc',
          label: 'Refernce Address/LandMarks',
          error: error,
          controller: landmark,
          isPassword: false,
        ),
        CustomTextField(
          icons: Icons.contact_phone,
          hinttext: 'Phone Number',
          label: 'Contact Phone',
          error: error,
          controller: contactNumber,
          isPassword: false,
        ),
        CustomTextField(
            controller: productPrice,
            hinttext: 'Expected Price',
            label: 'Product Price',
            isPassword: false,
            icons: Icons.price_change,
            error: error),
      ],
    );
  }
}
