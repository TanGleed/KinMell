// // import 'package:app/constants/globalvariable.dart';
// // import 'package:app/views/upload/widgets/inputtextField.dart';
// // import 'package:flutter/material.dart';

// // class Step4 extends StatelessWidget {
// //   final String? productName;

// //   final String? landMark;
// //   final String? contactNumber;
// //   final String? location;
// //   final String? productPrice;
// //   final GlobalKey<FormState> step4FormKey;
// //   const Step4({
// //     Key? key,
// //     required this.contactNumber,
// //     required this.landMark,
// //     required this.location,
// //     required this.productName,
// //     required this.productPrice,
// //     required this.step4FormKey,
// //   }) : super(key: key);

// //   @override
// //   Widget build(BuildContext context) {
// //     return Form(
// //       key: step4FormKey,
// //       child: Column(
// //         crossAxisAlignment: CrossAxisAlignment.start,
// //         children: [
// //           commonTextField(context, productName, 'Product Name', 'Product Name',
// //               Icons.abc, false, false),
// //           SizedBox(
// //             height: GlobalVariables.screenHeight * 0.01,
// //           ),
// //           commonTextField(context, location, 'Street,City', 'location',
// //               Icons.location_on, false, false),
// //           SizedBox(
// //             height: GlobalVariables.screenHeight * 0.01,
// //           ),
// //           commonTextField(
// //               context,
// //               landMark,
// //               'LandMark/Goverment Offices/Schools/Parks etc',
// //               'landmark',
// //               Icons.location_city_outlined,
// //               false,
// //               false),
// //           SizedBox(
// //             height: GlobalVariables.screenHeight * 0.01,
// //           ),
// //           commonTextField(context, contactNumber, 'Contact/Phone',
// //               'Contact Number', Icons.phone, false, true),
// //           SizedBox(
// //             height: GlobalVariables.screenHeight * 0.01,
// //           ),
// //           commonTextField(context, productPrice, 'Expected Price',
// //               'Product Price', Icons.monetization_on, false, false),
// //           SizedBox(
// //             height: GlobalVariables.screenHeight * 0.01,
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// import 'package:app/constants/globalvariable.dart';
// import 'package:app/views/upload/widgets/inputtextField.dart';
// import 'package:flutter/material.dart';
// import 'package:snippet_coder_utils/FormHelper.dart';

// SizedBox Step4(
//   BuildContext context,
//   String? productName,
//   String? productStatus,
//   String? productCategories,
//   String? productDescription,
//   String? location,
//   String? landMark,
//   String? contactNumber,
//   String? productPrice,
//   List<dynamic> productType,
//   List<dynamic> productCondition,
//   List<String> images,
// ) {
//   return SizedBox(
//     width: double.infinity,
//     child: SingleChildScrollView(
//       child: Padding(
//         padding:
//             EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
//         child: Column(
//           children: [
//             SizedBox(
//               height: GlobalVariables.screenHeight * 0.028,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 TextButton(
//                     onPressed: () {},
//                     child: Icon(Icons.arrow_back_ios_new_rounded)),
//                 Text(
//                   "Confirmation page",
//                   style: TextStyle(
//                       fontSize: getProportionateScreenWidth(27),
//                       color: Colors.black,
//                       fontWeight: FontWeight.bold),
//                 ),
//                 TextButton(
//                     onPressed: () {},
//                     child: Icon(Icons.arrow_forward_ios_rounded))
//               ],
//             ),
//             SizedBox(
//               height: GlobalVariables.screenHeight * 0.028,
//             ),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 commonTextFieldStep4(context, productName, 'Product Name',
//                     'Product Name', Icons.abc, false, false, productName),
//                 SizedBox(
//                   height: GlobalVariables.screenHeight * 0.01,
//                 ),
//                 commonTextFieldStep4(context, location, 'Street,City',
//                     'location', Icons.location_on, false, false, location),
//                 SizedBox(
//                   height: GlobalVariables.screenHeight * 0.01,
//                 ),
//                 commonTextFieldStep4(
//                     context,
//                     landMark,
//                     'LandMark/Goverment Offices/Schools/Parks etc',
//                     'landmark',
//                     Icons.location_city_outlined,
//                     false,
//                     false,
//                     landMark),
//                 SizedBox(
//                   height: GlobalVariables.screenHeight * 0.01,
//                 ),
//                 commonTextFieldStep4(context, contactNumber, 'Contact/Phone',
//                     'Contact Number', Icons.phone, false, true, contactNumber),
//                 SizedBox(
//                   height: GlobalVariables.screenHeight * 0.01,
//                 ),
//                 commonTextFieldStep4(
//                     context,
//                     productPrice,
//                     'Expected Price',
//                     'Product Price',
//                     Icons.monetization_on,
//                     false,
//                     false,
//                     productPrice),
//                 SizedBox(
//                   height: GlobalVariables.screenHeight * 0.01,
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     ),
//   );
// }

// Widget commonTextFieldStep4(
//     BuildContext context,
//     String? value,
//     String hintText,
//     String key,
//     IconData icons,
//     bool isMultiline,
//     bool isPhone,
//     String? val) {
//   return FormHelper.inputFieldWidget(
//     context,
//     key,
//     hintText,
//     (onValidate) {
//       if (onValidate.isEmpty) return '*Required';

//       return null;
//     },
//     (onSaved) {
//       value = onSaved.toString().trim();
//     },
//     initialValue: val!,
//     isNumeric: isPhone,
//     showPrefixIcon: true,
//     prefixIcon: Icon(icons),
//     borderRadius: 10,
//     contentPadding: 15,
//     fontSize: 14,
//     prefixIconPaddingLeft: 10,
//     prefixIconColor: Colors.black,
//     borderColor: Colors.grey.shade400,
//     hintColor: Colors.black.withOpacity(0.6),
//     backgroundColor: Colors.grey.shade100,
//     borderFocusColor: Colors.grey.shade200,
//     isMultiline: isMultiline,
//     multilineRows: isMultiline ? 5 : 1,
//     onChange: (val) {
//       value = val;
//     },
//   );
// }
