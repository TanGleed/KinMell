import 'package:app/constants/globalvariable.dart';
import 'package:app/views/upload/widgets/dropdownmenu.dart';
import 'package:app/views/upload/widgets/inputtextField.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/multi_images_utils.dart';

class Step1 extends StatefulWidget {
  final String? productName;
  final String? productStatus;
  final String? productCategories;
  final String? productDescription;
  final List<dynamic> productType;
  final List<dynamic> productCondition;
  final GlobalKey<FormState> step1FormKey;
  const Step1({
    Key? key,
    required this.step1FormKey,
    required this.productName,
    required this.productCategories,
    required this.productCondition,
    required this.productStatus,
    required this.productDescription,
    required this.productType,
  }) : super(key: key);

  @override
  State<Step1> createState() => _Step1State();
}

class _Step1State extends State<Step1> {
  List<String> images = [];
  @override
  Widget build(BuildContext context) {
    GlobalVariables().init(context);
    return Form(
      key: widget.step1FormKey,
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                commonTextField(context, widget.productName, "Product Name",
                    "Product Name", Icons.abc, false, false),
                SizedBox(
                  height: GlobalVariables.screenHeight * 0.02,
                ),
                commonDropDownMenu(
                    context,
                    'Product Categories',
                    widget.productCategories,
                    widget.productType,
                    Icons.category),
                SizedBox(
                  height: GlobalVariables.screenHeight * 0.02,
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
                SizedBox(
                  height: GlobalVariables.screenHeight * 0.02,
                ),
                commonDropDownMenu(
                    context,
                    'Product Type',
                    widget.productStatus,
                    widget.productCondition,
                    Icons.control_point_duplicate_outlined),
                SizedBox(
                  height: GlobalVariables.screenHeight * 0.02,
                ),
                commonTextField(
                  context,
                  widget.productDescription,
                  "Enter Product Description",
                  "Product Description",
                  Icons.description_sharp,
                  true,
                  false,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
