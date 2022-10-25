import 'package:app/constants/globalvariable.dart';
import 'package:app/views/upload/services/uploadModal.dart';
import 'package:flutter/material.dart';

class StepBarIndicator {
  Padding buildBox(bool isActive) {
    return Padding(
      padding: EdgeInsets.only(
        top: GlobalVariables.screenHeight * 0.02,
        right: GlobalVariables.screenHeight * 0.01,
        left: GlobalVariables.screenHeight * 0.01,
      ),
      child: Container(
        height: isActive
            ? GlobalVariables.screenHeight * 0.01
            : GlobalVariables.screenHeight * 0.005,
        width: isActive
            ? GlobalVariables.screenHeight * 0.15
            : GlobalVariables.screenHeight * 0.08,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          shape: BoxShape.rectangle,
          color: isActive ? Colors.blue.shade500 : Colors.grey.shade500,
        ),
      ),
    );
  }

  Padding buildBar(UploadModal modal) {
    return Padding(
      padding: EdgeInsets.only(
          left: getProportionateScreenWidth(2),
          right: getProportionateScreenWidth(2),
          top: modal.isStep1
              ? getProportionateScreenHeight(2)
              : getProportionateScreenHeight(12)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildBox(modal.isStep1),
          buildBox(modal.isStep2),
          buildBox(modal.isStep3),
        ],
      ),
    );
  }
}
