import 'dart:io';

import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';

class ValidationProvider extends ChangeNotifier {
  TextEditingController inputController = TextEditingController();
  TextEditingController outputController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isDisable = true;
  bool hasInternet = false;

  String? _validationForEmpty(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter text';
    } else {
      return null;
    }
  }

  String? _validationForTwo(String value) {
    if (value.length < 2) {
      return 'Please enter text of more than 2 characters';
    } else {
      return null;
    }
  }

  String? _validationForFifty(String value) {
    if (value.length > 50) {
      return 'Please enter text of less than 50 characters';
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

  void updateOutputController(String translated) {
    outputController.text = translated;
  }

  void _hasNoConection() {
    hasInternet = false;
    notifyListeners();
  }

  void _hasConection() {
    hasInternet = true;
    notifyListeners();
  }

  Future<void> checkInternetConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        _hasConection();
      }
    } on SocketException catch (_) {
      _hasNoConection();
    } catch (_) {
      //* something went wrong
      print(_);

      rethrow;
    }

    notifyListeners();
  }

  // Future retryInternetConnection() async {
  //   await checkInternetConnection();
  //notifyListeners();
  // }

  void checkInternetRepeatedly() {
    EasyDebounce.debounce(
      'check_internet',
      const Duration(seconds: 10),
      () async {
        await checkInternetConnection();
        checkInternetRepeatedly();
      },
    );
    //notifyListeners();
  }
}
