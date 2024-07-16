import 'package:flutter/material.dart';
import 'package:linguify/core/components/text_box_widget.dart';
import 'package:linguify/theme/app_theme.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

//* FormKey
class _HomeViewState extends State<HomeView> {
  late final TextEditingController inputController;

  late final TextEditingController outputController;

  final _formKey = GlobalKey<FormState>();

  String? validateDigit(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter text";
    } else if (value.length < 2) {
      return "Please enter text of more than 2 characters.";
    } else if (value.length > 50) {
      return "Please enter text of less than 50 characters";
    } else {
      return null;
    }
  }

  @override
  void initState() {
    inputController = TextEditingController();
    outputController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: AppPadding.pagePadding,
          child: Form(
            key:_formKey,
            child: Column(
              children: [
                //* Logo
                SizedBox(
                  height: 200,
                  child: Image.asset(
                    "/Users/sedat/Desktop/selin/linguify/assets/images/linguify_logo.jpeg",
                  ),
                ),
          
                AppSpacing.smallVerticalSpace,
          
                //* Input Field
                SizedBox(
                  height: 175,
                    child: TextBoxWidget(
                      formKey: _formKey,
                      validateDigit: validateDigit,
                      controller: inputController,
                      hintText: "Start translation",
                      hasClearButton: true,
                    ),
                  ),
                
          
                const Divider(
                  height: 40,
                  thickness: 1,
                  color: AppColors.dividerColor,
                ),
          
                //* Output Field
                SizedBox(
                  height: 175,
                  child: TextBoxWidget(
                    controller: outputController,
                    hintText: "Output",
                    hasCopyButton: true,
                  ),
                ),
          
              
              ],
            ),
          ),
        ),
      ),
    );
  }
}
