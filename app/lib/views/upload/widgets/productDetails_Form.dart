import 'package:app/constants/globalvariable.dart';
import 'package:app/utils/keyboard.dart';
import 'package:app/views/upload/services/uploadModal.dart';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/multi_images_utils.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  GlobalKey<FormState> productDetailsFormKey = GlobalKey<FormState>();
  static List<dynamic> productCategories = [];
  static List<dynamic> productCondition = [];
  @override
  void initState() {
    // TODO: implement initState
    UploadModal.productCategories.add({"val": "1", "label": "Electronics"});
    UploadModal.productCategories.add({"val": "2", "label": "Notes"});

    UploadModal.productCondition.add({"val": "1", "label": "New"});
    UploadModal.productCondition.add({"val": "2", "label": "Used"});
    UploadModal.productCondition
        .add({"val": "3", "label": "Damaged(Can be Repaired)"});
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    UploadModal.productCategories.clear();
    UploadModal.productCondition.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UploadModal>(builder: ((context, value, child) {
      return Scaffold(
        body: SizedBox(
          width: double.infinity,
          child: GestureDetector(
            onTap: () {
              KeyboardUtil.hideKeyboard(context);
            },
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20)),
                child: Column(
                  children: [
                    SizedBox(
                      height: GlobalVariables.screenHeight * 0.028,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Product Details",
                          style: TextStyle(
                              fontSize: getProportionateScreenWidth(27),
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: GlobalVariables.screenHeight * 0.028,
                    ),
                    Column(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: Column(
                            children: [
                              FormHelper.inputFieldWidget(
                                context,
                                'Name',
                                'Product Name',
                                (onValidate) {
                                  if (onValidate.isEmpty) return '*Required';

                                  return null;
                                },
                                (onSaved) {
                                  setState(() {
                                    value.productName =
                                        onSaved.toString().trim();
                                  });
                                },
                                initialValue: value.productName ?? 'Null',
                                showPrefixIcon: true,
                                prefixIcon: const Icon(Icons.abc),
                                borderRadius: 10,
                                contentPadding: 15,
                                fontSize: 14,
                                prefixIconPaddingLeft: 10,
                                prefixIconColor: Colors.black,
                                borderColor: Colors.grey.shade400,
                                hintColor: Colors.black.withOpacity(0.6),
                                backgroundColor: Colors.grey.shade100,
                                borderFocusColor: Colors.grey.shade200,
                                onChange: (val) {
                                  value.productName = val;
                                },
                              ),
                              SizedBox(
                                height: GlobalVariables.screenHeight * 0.02,
                              ),
                              FormHelper.dropDownWidget(
                                context,
                                'Product Categories',
                                value.prodcutCat,
                                UploadModal.productCategories,
                                (onValidate) {
                                  if (onValidate.isEmpty) {
                                    return '*Required';
                                  }
                                  return '*Required';
                                },
                                (onChanged) {
                                  setState(() {
                                    value.prodcutCat = onChanged!;
                                  });
                                },
                                showPrefixIcon: true,
                                prefixIcon: const Icon(Icons.category_sharp),
                                prefixIconPaddingLeft: 10,
                                prefixIconColor: Colors.black,
                                borderRadius: 10,
                                hintFontSize: 14,
                                hintColor: Colors.black.withOpacity(0.6),
                                contentPadding: 15,
                                borderColor: Colors.grey.shade400,
                                borderFocusColor: Colors.grey.shade200,
                                optionValue: "val",
                                optionLabel: "label",
                              ),
                              SizedBox(
                                height: GlobalVariables.screenHeight * 0.02,
                              ),
                              DottedBorder(
                                borderType: BorderType.RRect,
                                radius: const Radius.circular(10),
                                dashPattern: const [10, 4],
                                strokeCap: StrokeCap.round,
                                child: Container(
                                  height: getProportionateScreenHeight(230),
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: value.isImageEmpty
                                      ? uploadImageBox(value)
                                      : MultiImagePicker(
                                          totalImages: 6,
                                          imageSource: ImagePickSource.gallery,
                                          initialValue: value.images,
                                          onImageChanged: (image) {
                                            setState(() {
                                              value.images = image.toList();
                                            });
                                          },
                                        ),
                                ),
                              ),
                              SizedBox(
                                height: GlobalVariables.screenHeight * 0.03,
                              ),
                              FormHelper.dropDownWidget(
                                context,
                                'Product Condition',
                                value.productStat,
                                UploadModal.productCondition,
                                (onValidate) {
                                  if (onValidate.isEmpty) {
                                    return '*Required';
                                  }
                                  return '*Required';
                                },
                                (onChanged) {
                                  setState(() {
                                    value.productStat =
                                        onChanged.toString().trim();
                                  });
                                },
                                showPrefixIcon: true,
                                prefixIcon: const Icon(Icons.category_sharp),
                                prefixIconPaddingLeft: 10,
                                prefixIconColor: Colors.black,
                                borderRadius: 10,
                                hintFontSize: 14,
                                hintColor: Colors.black.withOpacity(0.6),
                                contentPadding: 15,
                                borderColor: Colors.grey.shade400,
                                borderFocusColor: Colors.grey.shade200,
                                optionValue: "val",
                                optionLabel: "label",
                              ),
                              SizedBox(
                                height: GlobalVariables.screenHeight * 0.03,
                              ),
                              FormHelper.inputFieldWidget(
                                context,
                                'Description',
                                'Product Description',
                                (onValidate) {
                                  if (onValidate.isEmpty) return '*Required';

                                  return null;
                                },
                                (onSaved) {
                                  setState(() {
                                    value.productDescription =
                                        onSaved.toString().trim();
                                  });
                                },
                                initialValue:
                                    value.productDescription ?? 'Null',
                                showPrefixIcon: true,
                                prefixIcon: const Icon(Icons.description_sharp),
                                borderRadius: 10,
                                contentPadding: 15,
                                fontSize: 14,
                                prefixIconPaddingLeft: 10,
                                prefixIconColor: Colors.black,
                                borderColor: Colors.grey.shade400,
                                hintColor: Colors.black.withOpacity(0.6),
                                backgroundColor: Colors.grey.shade100,
                                borderFocusColor: Colors.grey.shade200,
                                isMultiline: true,
                                multilineRows: 8,
                                onChange: (val) {
                                  value.productDescription = val;
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Center(
                      child: Text(
                        ' Scroll to Next Step >>',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }));
  }

  Widget uploadImageBox(UploadModal value) {
    return GestureDetector(
      onTap: () {
        setState(() {
          value.isImageEmpty = false;
        });
      },
      child: Center(
        child: Padding(
            padding: EdgeInsets.only(top: GlobalVariables.screenHeight * 0.1),
            child: Column(
              children: [
                const Text('Upload Image Here'),
                Icon(Icons.file_upload_rounded),
              ],
            )),
      ),
    );
  }
}
