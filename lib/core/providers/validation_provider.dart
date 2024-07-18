import 'package:flutter/material.dart';

class ValidationProvider extends ChangeNotifier {
  TextEditingController inputController = TextEditingController();
  TextEditingController outputController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isDisable = true;

  String? _validationForEmpty(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter text";
    } else {
      return null;
    }
  }

  String? _validationForTwo(String value) {
    if (value.length < 2) {
      return "Please enter text of more than 2 characters";
    } else {
      return null;
    }
  }

  String? _validationForFifty(String value) {
    if (value.length > 50) {
      return "Please enter text of less than 50 characters";
    } else {
      return null;
    }
  }

  String? validateInputText(String? value) {
    if (value == null || value.isEmpty) {
      return _validationForEmpty(inputController.text);
    } else if (value.length < 2) {
      return _validationForTwo(inputController.text);
    } else if (value.length > 50) {
      return _validationForFifty(inputController.text);
    } else {
      return null;
    }
  }

  void validateForm() {
    if (formKey.currentState?.validate() ?? false) {
      isDisable = false;
    } else {
      isDisable = true;
    }

    notifyListeners();
  }
}
