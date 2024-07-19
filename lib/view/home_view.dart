// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:linguify/core/components/buttons/clear_button.dart';
import 'package:linguify/core/components/buttons/copy_button.dart';
import 'package:linguify/core/components/buttons/selection_button.dart';
import 'package:linguify/core/components/buttons/translate_button.dart';
import 'package:linguify/core/components/snackbar/snack_bar_extension.dart';
import 'package:linguify/core/components/text_box/text_box_widget.dart';
import 'package:linguify/core/constants/image_constants.dart';
import 'package:linguify/core/providers/translation_provider.dart';
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
                      child: Image.asset(ImageConstants.appIconPath),
                    ),

                    AppSpacing.smallVerticalSpace,

                    //* Input Field
                    SizedBox(
                      height: 175,
                      child: TextBoxWidget(
                        readOnly: false,
                        onChanged: (_) => provider.validateForm(),
                        controller: provider.inputController,
                        validator: provider.validateInputText,
                        hintText: "Start translation",
                        suffix: ClearButton(
                          onPressed: () {
                            provider.inputController.clear();
                            provider.validateForm();
                          },
                        ),
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
                        readOnly: true,
                        controller: provider.outputController,
                        hintText: "Output",
                        suffix: CopyButton(
                          onPressed: () async {
                            await Clipboard.setData(ClipboardData(
                                text: provider.outputController.text));
                            context.showInfoMessage(
                              message: "Copied Successfully!",
                            );
                          },
                        ),
                      ),
                    ),
                    const Spacer(flex: 2),

                    //* Selection Buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Consumer<TranslationProvider>(
                          builder: (_, provider, ___) {
                            return SelectionButton(
                              result: provider.currentForInput,
                              onChanged: (String? newLanguage) {
                                if (newLanguage != null) {
                                  provider.inputCurrentLanguage(newLanguage);
                                }
                              },
                            );
                          },
                        ),

                        const Text("to",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.dividerColor,
                        ),
                        ),
                        Consumer<TranslationProvider>(
                          builder: (_, provider, ___) {
                            return SelectionButton(
                              result: provider.currentForOutput,
                              onChanged: (String? newLanguage) {
                                if (newLanguage != null) {
                                  provider.outputCurrentLanguage(newLanguage);
                                }
                              },
                            );
                          },
                        ),
                      ],
                    ),

                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 75,
                      child: TranslateButton(
                        onPressed: provider.isDisable == true ? null : () {},
                        message: "Translate",
                      ),
                    ),
                    const Spacer(),
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
