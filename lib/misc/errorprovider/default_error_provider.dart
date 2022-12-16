import '../error/message_error.dart';
import '../error/validation_error.dart';
import 'error_provider.dart';

class DefaultErrorProvider extends ErrorProvider {
  @override
  ErrorProviderResult? onGetErrorProviderResult(e) {
    if (e is ValidationError) {
      return ErrorProviderResult(
        title: e.message,
        message: e.message
      );
    } else if (e is MessageError){
      return ErrorProviderResult(
        title: e.title,
        message: e.message
      );
    } else {
      return ErrorProviderResult(
        title: "Something Failed",
        message: e.toString()
      );
    }
  }
}