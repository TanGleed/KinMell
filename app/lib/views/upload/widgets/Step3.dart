import 'package:app/constants/globalvariable.dart';
import 'package:app/views/upload/widgets/inputtextField.dart';
import 'package:flutter/material.dart';

enum Pricingtype { Negotiable, Non_Negotiable }

class Step3 extends StatefulWidget {
  final String? productPrice;
  final GlobalKey<FormState> step3FormKey;
  const Step3({
    Key? key,
    required this.productPrice,
    required this.step3FormKey,
  }) : super(key: key);

  @override
  State<Step3> createState() => _Step3State();
}

class _Step3State extends State<Step3> {
  Pricingtype? _value;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.step3FormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          commonTextField(context, widget.productPrice, 'Expected Price',
              'Product Price', Icons.monetization_on, false, false),
          SizedBox(
            height: GlobalVariables.screenHeight * 0.01,
          ),
          const Text(
            'Pricing Type',
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 20,
            ),
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    flex: 1,
                    child: Row(
                      children: [
                        Radio(
                            value: Pricingtype.Negotiable,
                            groupValue: _value,
                            onChanged: (Pricingtype? value) {
                              setState(() {
                                _value = value;
                              });
                            }),
                        const Expanded(
                          child: Text('Negotiable'),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      children: [
                        Radio(
                            value: Pricingtype.Non_Negotiable,
                            groupValue: _value,
                            onChanged: (Pricingtype? value) {
                              setState(() {
                                _value = value;
                              });
                            }),
                        const Expanded(
                          child: Text('Non-Negotiable'),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
