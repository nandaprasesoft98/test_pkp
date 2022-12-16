import 'package:flutter/material.dart';

import 'errorprovider/error_provider.dart';
import 'prompt_indicator.dart';

class _WidgetHelperImpl {
  Widget buildPromptIndicator({
    required BuildContext context,
    Widget? image,
    String? promptTitleText,
    String? promptText,
    String? buttonText,
    VoidCallback? onPressed
  }) {
    return PromptIndicator(
      image: image,
      promptTitleText: promptTitleText,
      promptText: promptText,
      buttonText: buttonText ?? "OK",
      onPressed: onPressed
    );
  }

  Widget buildSuccessPromptIndicator({
    required BuildContext context,
    String? promptTitleText = "Success",
    String? promptText = "This process has been success...",
    String? buttonText,
    VoidCallback? onPressed
  }) {
    return buildPromptIndicator(
      context: context,
      image: const Icon(Icons.check_circle),
      promptTitleText: promptTitleText,
      promptText: promptText,
      buttonText: buttonText,
      onPressed: onPressed
    );
  }

  Widget buildFailedPromptIndicator({
    required BuildContext context,
    String? promptTitleText,
    String? promptText,
    String? buttonText,
    VoidCallback? onPressed
  }) {
    return buildPromptIndicator(
      context: context,
      image: const Icon(Icons.error),
      promptTitleText: promptTitleText,
      promptText: promptText,
      buttonText: buttonText,
      onPressed: onPressed
    );
  }

  Widget buildFailedPromptIndicatorFromErrorProvider({
    required BuildContext context,
    required ErrorProvider errorProvider,
    required dynamic e,
    String? buttonText,
    VoidCallback? onPressed
  }) {
    ErrorProviderResult? errorProviderResult = errorProvider.onGetErrorProviderResult(e);
    return buildPromptIndicator(
      context: context,
      image: const Icon(Icons.error),
      promptTitleText: errorProviderResult?.title,
      promptText: errorProviderResult?.message,
      buttonText: buttonText,
      onPressed: onPressed
    );
  }
}

// ignore: non_constant_identifier_names
var WidgetHelper = _WidgetHelperImpl();