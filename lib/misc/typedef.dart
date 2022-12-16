import 'package:flutter/widgets.dart';

import 'validation/validation_result.dart';
import 'validation/validator/validator.dart';

typedef WidgetBuilderWithValidatorResult = Widget Function(BuildContext, ValidationResult, Validator?);