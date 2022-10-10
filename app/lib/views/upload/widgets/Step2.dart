import 'package:flutter/material.dart';

import '../../../common/widgets/custom_TextField.dart';

class Step2 extends StatelessWidget {
  final String error;
  final TextEditingController location;
  final TextEditingController landmark;
  final TextEditingController contactNumber;
  const Step2(
      {Key? key,
      required this.landmark,
      required this.location,
      required this.contactNumber,
      required this.error})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      GestureDetector(
          onTap: () => Container(),
          child: CustomTextField(
            icons: Icons.place,
            hinttext: 'Street,City',
            label: 'Your Location',
            error: error,
            controller: location,
            isPassword: false,
          )),
      const SizedBox(
        height: 10,
      ),
      CustomTextField(
        icons: Icons.contact_phone,
        hinttext: 'Phone Number',
        label: 'Contact Phone',
        error: error,
        controller: contactNumber,
        isPassword: false,
      ),
      const SizedBox(
        height: 10,
      ),
      CustomTextField(
        icons: Icons.location_city_outlined,
        hinttext: 'LandMark/Goverment Offices/Schools/Parks etc',
        label: 'Refernce Address/LandMarks',
        error: error,
        controller: landmark,
        isPassword: false,
      ),
      const SizedBox(
        height: 10,
      ),
    ]);
  }
}
