import 'package:dio/dio.dart';
import 'package:dio_logger/dio_logger.dart';

class _DioHttpClientImpl {
  Dio? _dio;

  Dio of() {
    if (_dio == null) {
      BaseOptions baseOptions = BaseOptions(
        baseUrl: "https://jsonplaceholder.typicode.com"
      );
      _dio = _ModifiedDio(Dio(baseOptions));
      _dio?.interceptors.add(dioLoggerInterceptor);
    }

    return _dio ?? (throw NullThrownError());
  }
}

class _DioHttpClientOptionsImpl {
  Map<String, dynamic> createTokenHeader(String tokenWithBearer) {
    return <String, dynamic> {
      "Authorization": tokenWithBearer,
      "Accept": "application/json"
    };
  }

  Options createOptionsWithTokenHeader(String tokenWithBearer) {
    return Options(headers: createTokenHeader(tokenWithBearer));
  }
}

class _ModifiedDio implements Dio {
  final Dio _wrappedDio;

  _ModifiedDio(this._wrappedDio);

  Options get _optionsWithTokenHeader => Options();

  @override
  HttpClientAdapter get httpClientAdapter => _wrappedDio.httpClientAdapter;

  @override
  set httpClientAdapter(HttpClientAdapter value) => _wrappedDio.httpClientAdapter = value;

  @override
  BaseOptions get options => _wrappedDio.options;

  @override
  set options(BaseOptions value) => _wrappedDio.options = value;

  @override
  Interceptors get interceptors => _wrappedDio.interceptors;

  @override
  Transformer get transformer => _wrappedDio.transformer;

  @override
  set transformer(Transformer value) => _wrappedDio.transformer = value;

  @override
  void clear() => _wrappedDio.clear();

  @override
  void close({bool force = false}) => _wrappedDio.close();

  @override
  Future<Response<T>> delete<T>(String path, {data, Map<String, dynamic>? queryParameters, Options? options, CancelToken? cancelToken})
    => _wrappedDio.delete(path, data: data, queryParameters: queryParameters, options: _optionsWithTokenHeader.merge(options, allowHeadersMerging: false), cancelToken: cancelToken);

  @override
  Future<Response<T>> deleteUri<T>(Uri uri, {data, Options? options, CancelToken? cancelToken})
    => _wrappedDio.deleteUri(uri, data: data, options: _optionsWithTokenHeader.merge(options, allowHeadersMerging: false), cancelToken: cancelToken);

  @override
  Future<Response> download(String urlPath, savePath, {ProgressCallback? onReceiveProgress, Map<String, dynamic>? queryParameters, CancelToken? cancelToken, bool deleteOnError = true, String lengthHeader = Headers.contentLengthHeader, data, Options? options})
    => _wrappedDio.download(urlPath, savePath, onReceiveProgress: onReceiveProgress, queryParameters: queryParameters, cancelToken: cancelToken, deleteOnError: deleteOnError, lengthHeader: lengthHeader, data: data, options: _optionsWithTokenHeader.merge(options, allowHeadersMerging: false));

  @override
  Future<Response> downloadUri(Uri uri, savePath, {ProgressCallback? onReceiveProgress, CancelToken? cancelToken, bool deleteOnError = true, String lengthHeader = Headers.contentLengthHeader, data, Options? options})
    => _wrappedDio.downloadUri(uri, savePath, onReceiveProgress: onReceiveProgress, cancelToken: cancelToken, deleteOnError: deleteOnError, lengthHeader: lengthHeader, data: data, options: _optionsWithTokenHeader.merge(options, allowHeadersMerging: false));

  @override
  Future<Response<T>> fetch<T>(RequestOptions requestOptions) => _wrappedDio.fetch(requestOptions);

  @override
  Future<Response<T>> get<T>(String path, {Map<String, dynamic>? queryParameters, Options? options, CancelToken? cancelToken, ProgressCallback? onReceiveProgress})
    => _wrappedDio.get(path, queryParameters: queryParameters, options: _optionsWithTokenHeader.merge(options, allowHeadersMerging: false), cancelToken: cancelToken, onReceiveProgress: onReceiveProgress);

  @override
  Future<Response<T>> getUri<T>(Uri uri, {Options? options, CancelToken? cancelToken, ProgressCallback? onReceiveProgress})
    => _wrappedDio.getUri(uri, options: _optionsWithTokenHeader.merge(options, allowHeadersMerging: false), cancelToken: cancelToken, onReceiveProgress: onReceiveProgress);

  @override
  Future<Response<T>> head<T>(String path, {data, Map<String, dynamic>? queryParameters, Options? options, CancelToken? cancelToken})
    => _wrappedDio.head(path, data: data, queryParameters: queryParameters, options: _optionsWithTokenHeader.merge(options, allowHeadersMerging: false), cancelToken: cancelToken);

  @override
  Future<Response<T>> headUri<T>(Uri uri, {data, Options? options, CancelToken? cancelToken})
    => _wrappedDio.headUri(uri, data: data, options: _optionsWithTokenHeader.merge(options, allowHeadersMerging: false), cancelToken: cancelToken);

  @override
  void lock() => _wrappedDio.lock();

  @override
  Future<Response<T>> patch<T>(String path, {data, Map<String, dynamic>? queryParameters, Options? options, CancelToken? cancelToken, ProgressCallback? onSendProgress, ProgressCallback? onReceiveProgress})
    => _wrappedDio.patch(path, data: data, queryParameters: queryParameters, options: _optionsWithTokenHeader.merge(options, allowHeadersMerging: false), cancelToken: cancelToken, onSendProgress: onSendProgress, onReceiveProgress: onReceiveProgress);

  @override
  Future<Response<T>> patchUri<T>(Uri uri, {data, Options? options, CancelToken? cancelToken, ProgressCallback? onSendProgress, ProgressCallback? onReceiveProgress})
    => _wrappedDio.patchUri(uri, data: data, options: _optionsWithTokenHeader.merge(options, allowHeadersMerging: false), cancelToken: cancelToken, onSendProgress: onSendProgress, onReceiveProgress: onReceiveProgress);

  @override
  Future<Response<T>> post<T>(String path, {data, Map<String, dynamic>? queryParameters, Options? options, CancelToken? cancelToken, ProgressCallback? onSendProgress, ProgressCallback? onReceiveProgress})
    => _wrappedDio.post(path, data: data, queryParameters: queryParameters, options: _optionsWithTokenHeader.merge(options, allowHeadersMerging: false), cancelToken: cancelToken, onSendProgress: onSendProgress, onReceiveProgress: onReceiveProgress);

  @override
  Future<Response<T>> postUri<T>(Uri uri, {data, Options? options, CancelToken? cancelToken, ProgressCallback? onSendProgress, ProgressCallback? onReceiveProgress})
    => _wrappedDio.postUri(uri, data: data, options: _optionsWithTokenHeader.merge(options, allowHeadersMerging: false), cancelToken: cancelToken, onSendProgress: onSendProgress, onReceiveProgress: onReceiveProgress);

  @override
  Future<Response<T>> put<T>(String path, {data, Map<String, dynamic>? queryParameters, Options? options, CancelToken? cancelToken, ProgressCallback? onSendProgress, ProgressCallback? onReceiveProgress})
    => _wrappedDio.put(path, data: data, queryParameters: queryParameters, options: _optionsWithTokenHeader.merge(options, allowHeadersMerging: false), cancelToken: cancelToken, onSendProgress: onSendProgress, onReceiveProgress: onReceiveProgress);

  @override
  Future<Response<T>> putUri<T>(Uri uri, {data, Options? options, CancelToken? cancelToken, ProgressCallback? onSendProgress, ProgressCallback? onReceiveProgress})
    => _wrappedDio.putUri(uri, data: data, options: _optionsWithTokenHeader.merge(options, allowHeadersMerging: false), cancelToken: cancelToken, onSendProgress: onSendProgress, onReceiveProgress: onReceiveProgress);

  @override
  Future<Response<T>> request<T>(String path, {data, Map<String, dynamic>? queryParameters, CancelToken? cancelToken, Options? options, ProgressCallback? onSendProgress, ProgressCallback? onReceiveProgress})
    => _wrappedDio.request(path, data: data, queryParameters: queryParameters, options: _optionsWithTokenHeader.merge(options, allowHeadersMerging: false), cancelToken: cancelToken, onSendProgress: onSendProgress, onReceiveProgress: onReceiveProgress);

  @override
  Future<Response<T>> requestUri<T>(Uri uri, {data, CancelToken? cancelToken, Options? options, ProgressCallback? onSendProgress, ProgressCallback? onReceiveProgress})
    => _wrappedDio.requestUri(uri, data: data, options: _optionsWithTokenHeader.merge(options, allowHeadersMerging: false), cancelToken: cancelToken, onSendProgress: onSendProgress, onReceiveProgress: onReceiveProgress);

  @override
  void unlock() => _wrappedDio.unlock();
}

// ignore: non_constant_identifier_names
var DioHttpClient = _DioHttpClientImpl();

// ignore: non_constant_identifier_names
var DioHttpClientOptions = _DioHttpClientOptionsImpl();

extension on Options {
  Options merge(
    Options? options, {
    bool allowMethodMerging = true,
    bool allowSendTimeoutMerging = true,
    bool allowReceiveTimeoutMerging = true,
    bool allowExtraMerging = true,
    bool allowHeadersMerging = true,
    bool allowResponseTypeMerging = true,
    bool allowContentTypeMerging = true,
    bool allowValidateStatusMerging = true,
    bool allowReceiveDataWhenStatusErrorMerging = true,
    bool allowFollowRedirectsMethodMerging = true,
    bool allowMaxRedirectsMerging = true,
    bool allowRequestEncoderMerging = true,
    bool allowResponseDecoderMerging = true,
    bool allowListFormatMerging = true,
  }) {
    if (options == null) {
      return this;
    }
    return copy(
      method: allowMethodMerging ? options.method : null,
      sendTimeout: allowSendTimeoutMerging ? options.sendTimeout : null,
      receiveTimeout: allowReceiveTimeoutMerging ? options.receiveTimeout : null,
      extra: allowExtraMerging ? options.extra : null,
      headers: allowHeadersMerging ? options.headers : null,
      responseType: allowResponseTypeMerging ? options.responseType : null,
      contentType: allowContentTypeMerging ? options.contentType : null,
      validateStatus: allowValidateStatusMerging ? options.validateStatus : null,
      receiveDataWhenStatusError: allowReceiveDataWhenStatusErrorMerging ? options.receiveDataWhenStatusError : null,
      followRedirects: allowFollowRedirectsMethodMerging ? options.followRedirects : null,
      maxRedirects: allowMaxRedirectsMerging ? options.maxRedirects : null,
      requestEncoder: allowRequestEncoderMerging ? options.requestEncoder : null,
      responseDecoder: allowResponseDecoderMerging ? options.responseDecoder : null,
      listFormat: allowListFormatMerging ? options.listFormat : null
    );
  }

  Options copy({
    String? method,
    int? sendTimeout,
    int? receiveTimeout,
    Map<String, dynamic>? extra,
    Map<String, dynamic>? headers,
    ResponseType? responseType,
    String? contentType,
    ValidateStatus? validateStatus,
    bool? receiveDataWhenStatusError,
    bool? followRedirects,
    int? maxRedirects,
    RequestEncoder? requestEncoder,
    ResponseDecoder? responseDecoder,
    ListFormat? listFormat,
  }) {
    return Options(
      method: method ?? this.method,
      sendTimeout: sendTimeout ?? this.sendTimeout,
      receiveTimeout: receiveTimeout ?? this.receiveTimeout,
      extra: extra ?? this.extra,
      headers: headers ?? this.headers,
      responseType: responseType ?? this.responseType,
      contentType: contentType ?? this.contentType,
      validateStatus: validateStatus ?? this.validateStatus,
      receiveDataWhenStatusError: receiveDataWhenStatusError ?? this.receiveDataWhenStatusError,
      followRedirects: followRedirects ?? this.followRedirects,
      maxRedirects: maxRedirects ?? this.maxRedirects,
      requestEncoder: requestEncoder ?? this.requestEncoder,
      responseDecoder: responseDecoder ?? this.responseDecoder,
      listFormat: listFormat ?? this.listFormat
    );
  }
}