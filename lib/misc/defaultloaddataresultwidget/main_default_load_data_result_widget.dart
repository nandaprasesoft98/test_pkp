import 'package:flutter/material.dart';

import '../errorprovider/error_provider.dart';
import '../load_data_result.dart';
import '../modified_loading_indicator.dart';
import '../widget_helper.dart';
import 'default_load_data_result_widget.dart';

class MainDefaultLoadDataResultWidget extends DefaultLoadDataResultWidget {
  @override
  Widget noLoadDataResultWidget(BuildContext context, NoLoadDataResult noLoadDataResult) {
    return Container();
  }

  @override
  Widget isLoadingLoadDataResultWidget(BuildContext context, IsLoadingLoadDataResult isLoadingLoadDataResult) {
    return const Center(child: ModifiedLoadingIndicator());
  }

  @override
  Widget successLoadDataResultWidget(BuildContext context, SuccessLoadDataResult successLoadDataResult) {
    return Container();
  }

  @override
  Widget failedLoadDataResultWidget(BuildContext context, FailedLoadDataResult failedLoadDataResult, ErrorProvider errorProvider) {
    return WidgetHelper.buildFailedPromptIndicatorFromErrorProvider(context: context, errorProvider: errorProvider, e: failedLoadDataResult.e);
  }
}