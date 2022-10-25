import 'package:app/config/config.dart';
import 'package:app/views/upload/services/uploadModal.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:snippet_coder_utils/FormHelper.dart';

import '../../../constants/globalvariable.dart';

class ProductPricingDetails extends StatefulWidget {
  const ProductPricingDetails({super.key});

  @override
  State<ProductPricingDetails> createState() => _ProductPricingDetailsState();
}

class _ProductPricingDetailsState extends State<ProductPricingDetails> {
  @override
  Widget build(BuildContext context) {
    return Consumer<UploadModal>(builder: ((context, modal, child) {
      return SizedBox(
        width: double.infinity,
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
                      "Pricing",
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FormHelper.inputFieldWidget(
                      context,
                      'price',
                      'Product Price',
                      (onValidate) {
                        if (onValidate.isEmpty) return '*Required';

                        return null;
                      },
                      (onSaved) {
                        setState(() {
                          modal.productPrice = onSaved.toString().trim();
                        });
                      },
                      initialValue: modal.productPrice ?? 'Null',
                      showPrefixIcon: true,
                      prefixIcon: const Icon(Icons.monetization_on_rounded),
                      borderRadius: 10,
                      contentPadding: 15,
                      fontSize: 14,
                      prefixIconPaddingLeft: 10,
                      prefixIconColor: Colors.black,
                      borderColor: Colors.grey.shade400,
                      hintColor: Colors.black.withOpacity(0.6),
                      backgroundColor: Colors.grey.shade100,
                      borderFocusColor: Colors.grey.shade200,
                      isNumeric: true,
                      onChange: (val) {
                        setState(() {
                          modal.productPrice = val;
                        });
                      },
                    ),
                    SizedBox(
                      height: GlobalVariables.screenHeight * 0.01,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: getProportionateScreenWidth(20),
                          right: getProportionateScreenWidth(20)),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey.shade200,
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  left: getProportionateScreenWidth(15),
                                  top: getProportionateScreenHeight(4)),
                              child: Row(
                                children: const [
                                  Text(
                                    'Pricing Type',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // Spacer(
                            //   flex: 1,
                            // ),
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Row(
                                        children: [
                                          Radio(
                                              value: Pricingtype.Negotiable,
                                              groupValue: modal.pricingtype,
                                              onChanged: (Pricingtype? val) {
                                                setState(() {
                                                  modal.pricingtype = val;
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
                                              groupValue: modal.pricingtype,
                                              onChanged: (Pricingtype? val) {
                                                setState(() {
                                                  modal.pricingtype = val;
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
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: getProportionateScreenHeight(410),
                ),
                FormHelper.submitButton('Upload Product ', () {
                  if (modal.validateAndSave()) {
                    FormHelper.showSimpleAlertDialog(
                        context,
                        'Successful',
                        'Product Upload Successful!! And will be listed for buying after necessary verification',
                        'Ok', () {
                      Navigator.pop(context);
                      Navigator.pushNamedAndRemoveUntil(
                          context, 'homepage-screen', (route) => false);
                    });
                  } else {
                    FormHelper.showSimpleAlertDialog(
                        context,
                        Config.appName,
                        'Error!!\nMake sure You have provided all the necessarry datas',
                        'Ok', () {
                      Navigator.pop(context);
                    });
                  }
                },
                    btnColor: Colors.deepPurple,
                    borderColor: Colors.white,
                    borderRadius: 20,
                    txtColor: Colors.white),
              ],
            ),
          ),
        ),
      );
    }));
  }
}
