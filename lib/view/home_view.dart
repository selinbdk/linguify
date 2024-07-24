// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:linguify/core/components/buttons/clear_button.dart';
import 'package:linguify/core/components/buttons/copy_button.dart';
import 'package:linguify/core/components/buttons/selection_button.dart';
import 'package:linguify/core/components/buttons/translate_button.dart';
import 'package:linguify/core/components/snackbar/snack_bar_extension.dart';
import 'package:linguify/core/components/text_box/text_box_widget.dart';
import 'package:linguify/core/constants/image_constants.dart';
import 'package:linguify/core/models/response/language_listings/language_model.dart';
import 'package:linguify/core/providers/translation_provider.dart';
import 'package:linguify/core/providers/validation_provider.dart';
import 'package:linguify/core/repository/repository.dart';
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
            builder: (_, validationProvider, ___) {
              return Form(
                key: validationProvider.formKey,
                child: Column(
                  children: [
                    //* Logo
                    Hero(
                      tag: "linguifyLogo",
                      child: SizedBox(
                        height: 200,
                        child: Image.asset(ImageConstants.appIconPath),
                      ),
                    ),

                    AppSpacing.smallVerticalSpace,

                    //* Input Field
                    SizedBox(
                      height: 175,
                      child: TextBoxWidget(
                        readOnly: false,
                        onChanged: (text) {
                          EasyDebounce.debounce(
                            'my-debouncer', // <-- An ID for this particular debouncer
                            const Duration(
                              milliseconds: 500,
                            ), // <-- The debounce duration
                            () async {
                              if (text.length > 2 && text.length < 50) {
                                final detectLanguageResultModel =
                                    await TranslationRepository()
                                        .detectLanguage(text);

                                final provider =
                                    context.read<TranslationProvider>();

                                final detectedLanguage = provider.languageList
                                    ?.firstWhere((e) =>
                                        detectLanguageResultModel
                                            .detectedLanguages
                                            ?.contains(e?.languageCode) ??
                                        false);

                                provider.detectedLanguage = detectedLanguage;

                                validationProvider.validateForm();
                              }
                            },
                          );
                        },
                        controller: validationProvider.inputController,
                        validator: validationProvider.validateInputText,
                        hintText: "Start translation",
                        suffix: ClearButton(
                          onPressed: () {
                            validationProvider.inputController.clear();
                            validationProvider.validateForm();
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
                        controller: validationProvider.outputController,
                        hintText: validationProvider.outputController.text,
                        suffix: CopyButton(
                          onPressed: () async {
                            await Clipboard.setData(ClipboardData(
                                text:
                                    validationProvider.outputController.text));
                            context.showInfoMessage(
                              message: "Copied Successfully!",
                            );
                          },
                        ),
                      ),
                    ),
                    const Spacer(flex: 2),

                    //* Selection Buttons
                    FittedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Consumer<TranslationProvider>(
                            builder: (_, provider, ___) {
                              log('sacsd');
                              return SelectionButton<LanguageModel?>(
                                click: provider.click,
                                itemList: provider.languageList,
                                texts: provider.languageList
                                    ?.map((e) => e?.displayName ?? '')
                                    .toList(),
                                result: provider.detectedLanguage,
                                onChanged: (LanguageModel? newLanguage) {
                                  if (newLanguage != null) {
                                    provider.changeInputLanguage(newLanguage);

                                    provider.toggleClick();
                                  }
                                },
                              );
                            },
                          ),
                          AppSpacing.smallHorizontalSpace,
                          const Text(
                            "to",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColors.dividerColor,
                            ),
                          ),
                          AppSpacing.smallHorizontalSpace,
                          Consumer<TranslationProvider>(
                            builder: (_, provider, ___) {
                              return SelectionButton<LanguageModel?>(
                                click: provider.click,
                                itemList: provider.languageList,
                                texts: provider.languageList
                                    ?.map((e) => e?.displayName ?? "")
                                    .toList(),
                                result: provider.currentForOutput,
                                onChanged: (
                                  LanguageModel? newLanguage,
                                ) {
                                  if (newLanguage != null) {
                                    provider.changeOutputLanguage(newLanguage);

                                    provider.toggleClick();
                                  }
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ),

                    //* Translate Button
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 75,
                      child: TranslateButton(
                        onPressed: validationProvider.isDisable == true
                            ? null
                            : () {
                                () async {
                                  final validationProvider =
                                      context.read<ValidationProvider>();
                                  final provider =
                                      context.read<TranslationProvider>();

                                  final translateResultModel =
                                      await TranslationRepository()
                                          .translateText(
                                              validationProvider
                                                  .inputController.text,
                                              provider.currentForOutput
                                                  ?.languageCode);

                                  provider.translationsList?.addAll(translateResultModel.translations ?? []);



                                //* Hata!!!! The property 'translated' can not be unconditionally accessed because the receiver can be null.

                                provider.translationsList?.map((e)=> validationProvider.outputController.text= e.translated?.first);
                                    
                                  

                        
                          
                                };
                              },
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
