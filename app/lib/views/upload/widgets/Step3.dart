import 'package:app/common/widgets/custom_TextField.dart';
import 'package:flutter/material.dart';

enum Pricingtype { Negotiable, Non_Negotiable }

class Step3 extends StatefulWidget {
  final TextEditingController productPrice;
  final String error;
  final GlobalKey<FormState> step3FormKey;
  const Step3({
    Key? key,
    required this.error,
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
          CustomTextField(
              controller: widget.productPrice,
              hinttext: 'Expected Price',
              label: 'Product Price',
              icons: Icons.price_change,
              error: widget.error),
          const SizedBox(
            height: 10,
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
