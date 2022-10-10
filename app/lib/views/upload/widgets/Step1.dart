import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/multi_images_utils.dart';

import '../../../common/widgets/custom_TextField.dart';

class Step1 extends StatefulWidget {
  final String error;

  final List<dynamic> productType;
  final List<dynamic> productCondition;
  final TextEditingController productName;
  final TextEditingController productDescription;
  final GlobalKey<FormState> step1FormKey;
  const Step1({
    Key? key,
    required this.error,
    required this.productName,
    required this.productDescription,
    required this.step1FormKey,
    required this.productType,
    required this.productCondition,
  }) : super(key: key);

  @override
  State<Step1> createState() => _Step1State();
}

class _Step1State extends State<Step1> {
  List<String> images = [];
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.step1FormKey,
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextField(
                icons: Icons.abc,
                hinttext: 'Title',
                label: 'Product Name',
                error: widget.error,
                controller: widget.productName,
              ),
              const SizedBox(
                height: 10,
              ),
              FormHelper.dropDownWidgetWithLabel(
                context,
                'Categories',
                'Product Type',
                '',
                widget.productType,
                (onChanged) {},
                (onValidate) {
                  if (onValidate.isEmpty) {
                    return '*Required';
                  }
                  return null;
                },
                borderRadius: 20,
                borderColor: Theme.of(context).primaryColor,
                borderFocusColor: Theme.of(context).primaryColor,
                optionValue: "val",
                optionLabel: "label",
                labelFontSize: 17,
              ),
              FormHelper.dropDownWidgetWithLabel(
                context,
                'Condition',
                'Product Condition',
                '',
                widget.productCondition,
                (onChanged) {},
                (onValidate) {
                  if (onValidate.isEmpty) return '*Required';
                  return null;
                },
                borderRadius: 20,
                borderColor: Theme.of(context).primaryColor,
                validationColor: Colors.red,
                borderFocusColor: Theme.of(context).primaryColor,
                optionValue: "val",
                optionLabel: "label",
                labelFontSize: 17,
              ),
              const SizedBox(
                height: 10,
              ),
              DottedBorder(
                borderType: BorderType.RRect,
                radius: const Radius.circular(10),
                dashPattern: const [10, 4],
                strokeCap: StrokeCap.round,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.25,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: MultiImagePicker(
                    totalImages: 6,
                    imageSource: ImagePickSource.gallery,
                    initialValue: images.toList(),
                    onImageChanged: (images) {
                      this.images = images;
                    },
                  ),
                ),
              ),
              CustomTextField(
                icons: Icons.description,
                hinttext: 'Short Description ',
                label: 'Product Description',
                error: widget.error,
                controller: widget.productDescription,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
