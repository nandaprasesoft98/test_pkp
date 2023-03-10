abstract class LoadDataResult<T> { }

class NoLoadDataResult<T> extends LoadDataResult<T> { }

class IsLoadingLoadDataResult<T> extends LoadDataResult<T> { }

class SuccessLoadDataResult<T> extends LoadDataResult<T> {
  T value;

  SuccessLoadDataResult({required this.value});
}

class FailedLoadDataResult<T> extends LoadDataResult<T> {
  dynamic e;

  FailedLoadDataResult({required this.e});
}

class LoadDataResultWrapper<T> {
  LoadDataResult<T> loadDataResult;

  LoadDataResultWrapper(this.loadDataResult);
}