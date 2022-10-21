import 'package:app/constants/globalvariable.dart';
import 'package:app/views/upload/widgets/inputtextField.dart';
import 'package:flutter/material.dart';

import '../../../common/widgets/custom_TextField.dart';

class Step2 extends StatefulWidget {
  final String? location;
  final String? landMark;
  final String? contactNumber;
  final GlobalKey<FormState> step2FormKey;
  const Step2({
    Key? key,
    required this.landMark,
    required this.location,
    required this.contactNumber,
    required this.step2FormKey,
  }) : super(key: key);

  @override
  State<Step2> createState() => _Step2State();
}

class _Step2State extends State<Step2> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.step2FormKey,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        GestureDetector(
          onTap: () => const Text('Error'),
          child: commonTextField(context, widget.location, 'City ,Country',
              'Location', Icons.location_pin, false, false),
        ),
        SizedBox(
          height: GlobalVariables.screenHeight * 0.01,
        ),
        commonTextField(context, widget.contactNumber, 'Contact/Phone',
            'Contact Number', Icons.phone, false, true),
        SizedBox(
          height: GlobalVariables.screenHeight * 0.01,
        ),
        commonTextField(
            context,
            widget.landMark,
            'LandMark/Goverment Offices/Schools/Parks etc',
            'landmark',
            Icons.location_city_outlined,
            false,
            false),
        SizedBox(
          height: GlobalVariables.screenHeight * 0.01,
        ),
      ]),
    );
  }
}
