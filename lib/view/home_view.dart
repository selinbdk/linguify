// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../core/components/buttons/clear_button.dart';
import '../core/components/buttons/copy_button.dart';
import '../core/components/buttons/selection_button.dart';
import '../core/components/buttons/translate_button.dart';
import '../core/components/snackbar/snack_bar_extension.dart';
import '../core/components/text_box/text_box_widget.dart';
import '../core/constants/image_constants.dart';
import '../core/models/request/translate_request_model/translate_request_model.dart';
import '../core/models/response/language_listings/language_model.dart';
import '../core/providers/translation_provider.dart';
import '../core/providers/validation_provider.dart';
import '../core/repository/repository.dart';
import '../theme/app_theme.dart';

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
                      tag: 'linguifyLogo',
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
                        controller: validationProvider.inputController,
                        validator: validationProvider.validateInputText,
                        hintText: 'Start translation',
                        suffix: ClearButton(
                          onPressed: () {
                            validationProvider.inputController.clear();
                            validationProvider.validateForm();
                          },
                        ),
                        onChanged: (text) {
                          EasyDebounce.debounce(
                            'my-debouncer',
                            const Duration(milliseconds: 500),
                            () async {
                              try {
                                if (text.length > 2 && text.length < 50) {
                                  final detectLanguageResultModel = await TranslationRepository().detectLanguage(text);
                                  final provider = context.read<TranslationProvider>();

                                  final detectedLanguage = provider.languageList?.firstWhere((e) =>
                                      detectLanguageResultModel.detectedLanguages?.contains(e?.languageCode) ?? false);

                                  provider.changeInputLanguage(detectedLanguage);
                                }
                              } on DioException catch (e) {
                                if (e.error is SocketException) {
                                  context.showErrorMessage(
                                    message: 'No Internet Connection',
                                    errorIcon: const Icon(Icons.wifi_off),
                                  );
                                } else if (e.response?.statusCode == 429) {
                                  context.showErrorMessage(
                                    message: 'Free trial is ended. Please refresh your token',
                                    errorIcon: const Icon(Icons.payments_sharp),
                                  );
                                } else {
                                  context.showErrorMessage(
                                    message: 'Something went wrong',
                                    errorIcon: const Icon(Icons.error_outline),
                                  );
                                }
                              } catch (e) {
                                context.showErrorMessage(
                                  message: 'Something went wrong',
                                  errorIcon: const Icon(Icons.error_outline),
                                );
                              } finally {
                                validationProvider.validateForm();
                              }
                            },
                          );
                        },
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
                        hintText: 'Output',
                        suffix: CopyButton(
                          onPressed: () async {
                            await Clipboard.setData(ClipboardData(text: validationProvider.outputController.text));
                            context.showInfoMessage(message: 'Copied Successfully!');
                          },
                        ),
                      ),
                    ),

                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          //* Selection Buttons
                          FittedBox(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                //* Input Selection Box
                                Consumer<TranslationProvider>(
                                  builder: (_, provider, ___) {
                                    return SelectionButton<LanguageModel?>(
                                      itemList: provider.languageList,
                                      texts: provider.languageList?.map((e) => e?.displayName ?? '').toList(),
                                      result: provider.detectedLanguage,
                                      onChanged: provider.changeInputLanguage,
                                    );
                                  },
                                ),
                                AppSpacing.smallHorizontalSpace,

                                ///
                                const Text(
                                  'to',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.dividerColor,
                                  ),
                                ),
                                AppSpacing.smallHorizontalSpace,

                                //* Output Selection Box
                                Consumer<TranslationProvider>(
                                  builder: (_, provider, ___) {
                                    return SelectionButton<LanguageModel?>(
                                      itemList: provider.languageList,
                                      texts: provider.languageList?.map((e) => e?.displayName ?? '').toList(),
                                      result: provider.currentForOutput,
                                      onChanged: provider.changeOutputLanguage,
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
                              onPressed: validationProvider.isDisable == true ? null : () async => _translate(context),
                            ),
                          ),
                        ],
                      ),
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

  Future<void> _translate(BuildContext context) async {
    try {
      final validationProvider = context.read<ValidationProvider>();
      final provider = context.read<TranslationProvider>();

      final translateRequest = TranslateRequestModel(
        from: provider.currentForInput?.languageCode ?? '',
        texts: [validationProvider.inputController.text],
        to: [provider.currentForOutput?.languageCode ?? ''],
      );

      final translateResultModel = await TranslationRepository().translateText(translateRequest);

      if (translateResultModel.translations != null) {
        final firstModel = translateResultModel.translations!.first;

        if (firstModel.translated != null) {
          validationProvider.updateOutputController(firstModel.translated!.first);
        }
      }
    } on DioException catch (e) {
      if (e.error is SocketException) {
        context.showErrorMessage(
          message: 'No Internet Connection',
          onRetryAction: () async => _translate(context),
          errorIcon: const Icon(Icons.wifi_off),
        );
      } else if (e.response?.statusCode == 429) {
        context.showErrorMessage(
          message: 'Free trial is ended. Please refresh your token',
          onRetryAction: () async => _translate(context),
          errorIcon: const Icon(Icons.payments_sharp),
        );
      } else {
        context.showErrorMessage(
          message: 'Something went wrong',
          onRetryAction: () async => _translate(context),
          errorIcon: const Icon(Icons.error_outline),
        );
      }
    } catch (e) {
      context.showErrorMessage(
        message: 'Something went wrong',
        onRetryAction: () async => _translate(context),
        errorIcon: const Icon(Icons.error_outline),
      );
    }
  }
}
