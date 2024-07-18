import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:linguify/core/components/text_box/text_box_widget.dart';
import 'package:linguify/core/components/translate_button.dart';
import 'package:linguify/core/providers/validation_provider.dart';
import 'package:linguify/theme/app_theme.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: AppPadding.pagePadding,
          child: Consumer<ValidationProvider>(
            builder: (_, provider, ___) {
              return Form(
                key: provider.formKey,
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
                      child: TextBoxWidget.withClear(
                        onChanged: (_) {
                          log('object');

                          provider.validateForm();
                        },
                        controller: provider.inputController,
                        validator: provider.validateInputText,
                        hintText: "Start translation",
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
                      child: TextBoxWidget.withCopy(
                        controller: provider.outputController,
                        hintText: "Output",
                      ),
                    ),

                    AppSpacing.megaLargeVertical,

                    TranslateButton(
                      onPressed: provider.isDisable == true ? null : () {},
                      message: "Translate",
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
