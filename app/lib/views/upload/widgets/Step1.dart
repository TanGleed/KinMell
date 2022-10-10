import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../../../common/widgets/custom_DropDownMenu.dart';
import '../../../common/widgets/custom_TextField.dart';

class Step1 extends StatelessWidget {
  final String error;
  final TextEditingController productName;
  final TextEditingController productDescription;
  const Step1({
    Key? key,
    required this.error,
    required this.productName,
    required this.productDescription,
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
        const SizedBox(
          height: 10,
        ),
        const CustomDropDownMenu(
          label: 'Categories',
          items: ['Notes', 'Education', 'Electronics', 'Drawing'],
        ),
        const SizedBox(
          height: 10,
        ),
        const CustomDropDownMenu(
          label: 'Condition',
          items: ['New', 'Used', 'Damaged', 'Found'],
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
            height: MediaQuery.of(context).size.height * 0.3,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            // child: Expanded(
            //   child: Padding(
            //     padding: const EdgeInsets.all(8.0),
            //     child: GridView.builder(
            //       itemCount: images!.length,
            //       gridDelegate:
            //           const SliverGridDelegateWithFixedCrossAxisCount(
            //               crossAxisCount: 3),
            //       itemBuilder: (BuildContext context, int index) {
            //         return Image.file(File(images![index].path),
            //             fit: BoxFit.cover);
            //       },
            //     ),
            //   ),
            // )
            //         : GestureDetector(
            //             onTap: selectImages,
            //             child: Column(
            //                 mainAxisAlignment: MainAxisAlignment.center,
            //                 children: [
            //                   const Icon(
            //                     Icons.add_a_photo,
            //                     size: 40,
            //                   ),
            //                   const SizedBox(height: 10),
            //                   Text(
            //                     'Upload Product Images',
            //                     style: TextStyle(
            //                       fontSize: 15,
            //                       color: Colors.grey.shade400,
            //                     ),
            //                   ),
            //                 ]),
            //           ),
          ),
        ),
        CustomTextField(
          icons: Icons.description,
          hinttext: 'Short Description ',
          label: 'Product Description',
          error: error,
          controller: productDescription,
          isPassword: false,
        ),
      ],
    );
  }
}
