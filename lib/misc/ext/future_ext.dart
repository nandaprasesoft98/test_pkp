import '../load_data_result.dart';
import 'load_data_result_ext.dart';

extension FutureExt<T> on Future<T> {
  Future<LoadDataResult<O>> getLoadDataResult<O>({MapLoadDataResultType<O, T>? mapLoadDataResult}) {
    return then<LoadDataResult<O>>((value) {
      if (mapLoadDataResult != null) {
        return SuccessLoadDataResult(value: mapLoadDataResult(value));
      } else {
        if (value is SuccessLoadDataResult) {
          return SuccessLoadDataResult(value: value.value as O);
        } else if (value is FailedLoadDataResult) {
          throw value.e;
        } else {
          return SuccessLoadDataResult(value: value as O);
        }
      }
    }).catchError((e) => FailedLoadDataResult<O>(e: e));
  }
}

extension LoadDataResultFutureExt<T> on Future<LoadDataResult<T>> {
  Future<LoadDataResult<O>> map<O>(MapLoadDataResultType<O, T> onMap) {
    return then<LoadDataResult<O>>((loadDataResult) {
      return loadDataResult.map(onMap);
    }).catchError((e) => FailedLoadDataResult<O>(e: e));
  }
}