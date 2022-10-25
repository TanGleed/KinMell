import 'package:flutter/cupertino.dart';

enum Pricingtype { Negotiable, Non_Negotiable }

class UploadModal extends ChangeNotifier {
  String? productName = '';
  String? prodcutCat;
  String? productStat;
  String? location = '';
  String? landMark = '';
  String? contactNUmber = '';
  String? productDescription = '';
  String? productPrice = '';
  GlobalKey<FormState> globalKeyState = GlobalKey<FormState>();

  static List<dynamic> productCategories = [];
  static List<dynamic> productCondition = [];
  PageController pgcontroller = PageController(initialPage: 0);
  List<String>? images = [];
  Pricingtype? pricingtype;
  //StepsInidicator
  int activeIndex = 0;
  int totalSteps = 3;
  bool isStep1 = true;
  bool isStep2 = false;
  bool isStep3 = false;
  bool isImageEmpty = true;

  changesStep(index) {
    activeIndex = index;
    switch (activeIndex) {
      case 0:
        isStep3 = false;
        isStep1 = true;
        isStep2 = false;
        break;
      case 1:
        isStep1 = false;
        isStep2 = true;
        isStep3 = false;
        break;
      case 2:
        isStep2 = false;
        isStep3 = true;
        break;
      default:
        isStep1 = true;
        isStep2 = false;
    }
    //validateAndSave(index);
    notifyListeners();
  }

  bool validateAndSave() {
    if (globalKeyState.currentState!.validate()) {
      globalKeyState.currentState!.save();
      return true;
    } else {
      return false;
    }
  }
}
