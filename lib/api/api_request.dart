import 'package:dio/dio.dart';

import '../general_exports.dart';

class ApiRequest {
  ApiRequest({
    required this.path,
    required this.method,
    required this.className,
    required this.requestFunction,
    this.header,
    this.body,
    this.queryParameters,
    this.formatResponse = false,
    this.withLoading = false,
    this.shouldShowMessage = true,
  });

  final MyAppController _myAppController = Get.find<MyAppController>();
  final String? path;
  final String? method;
  final String? className;
  final Map<String, dynamic>? header;
  String authorization() => _myAppController.userData != null
      ? 'Bearer ${_myAppController.userData['token']}'
      : '';
  String userId() => _myAppController.userData != null
      ? '${_myAppController.userData['userId']}'
      : '';
  final bool withLoading;
  final bool formatResponse;
  final bool shouldShowMessage;
  final dynamic body;
  final dynamic queryParameters;
  dynamic response;
  final Function? requestFunction;

  Future<Dio> _dio() async {
    return Dio(
      BaseOptions(
        headers: <String, dynamic>{
          'Authorization': authorization(),
          'Content-Type': '*/*',
          'Accept': '*/*',
          // 'sharedKey': 'nk?uVG#wdtRz?c5_EerWu0WzlTu9mrE_*23trum54',
          //'Accept-Language': Get.find<AppLanguageController>().appLocale,
          ...(header ?? <String, dynamic>{}),
          //'userId': userId(),
        },
        queryParameters: <String, dynamic>{
          ...queryParameters ?? <String, dynamic>{},
        },
      ),
    );
  }

  Future<void> request({
    Function()? beforeSend,
    Function(dynamic data, dynamic response)? onSuccess,
    Function(dynamic data, dynamic response, dynamic header)?
        onSuccessWithHeader,
    Function(dynamic error)? onError,
  }) async {
    // start request time
    final DateTime startTime = DateTime.now();

    final Dio dio = await _dio();

    try {
      if (withLoading) {
        startLoading();
      }
      // check method type
      switch (method) {
        case getMethod:
          response = await dio.get(
            baseUrl + path!,
          );

          break;
        case postMethod:
          response = await dio.post(
            baseUrl + path!,
            data: body,
          );
          break;
        case putMethod:
          response = await dio.put(
            baseUrl + path!,
            data: body,
          );
          break;
        case deleteMethod:
          response = await dio.delete(
            baseUrl + path!,
            data: body,
          );
          break;
      }
      // request time
      final int time = DateTime.now().difference(startTime).inMilliseconds;
      // print response data in console
      showRequestDetails(
        method: method,
        path: path,
        formatResponse: formatResponse,
        className: className,
        body: body.toString(),
        headers: dio.options.headers,
        queryParameters: dio.options.queryParameters.toString(),
        response: response.data,
        time: time,
      );

      if (withLoading) {
        dismissLoading();
      }

      if (onSuccess != null) {
        onSuccess(response.data, response.data);
      }
      if (onSuccessWithHeader != null) {
        onSuccessWithHeader(response.data, response.data, response.headers.map);
      }
    } on Exception catch (error) {
      consoleLog(error);
      dismissLoading();
      // request time
      final int time = DateTime.now().difference(startTime).inMilliseconds;

      if (error is DioError) {
        final dynamic errorData = error.response?.data ??
            <String, dynamic>{
              'errors': <Map<String, String>>[
                <String, String>{'message': 'Un handled Error'}
              ]
            };
        if (onError != null) {
          onError(errorData);
        }
        // print response error
        showRequestDetails(
          method: method,
          path: path,
          formatResponse: formatResponse,
          className: className,
          body: body.toString(),
          headers: dio.options.headers,
          queryParameters: dio.options.queryParameters.toString(),
          response: errorData,
          time: time,
          isError: true,
        );

        //handle DioError here by error type or by error code
        if (shouldShowMessage) {
          showToast(
            message:
                errorData['errors'] != null && errorData['errors'].length > 0
                    ? errorData['errors'][0]['message']
                    : errorData['message'],
          );
        }
      } else {
        // handle another errors
        showRequestDetails(
          method: method,
          path: path,
          formatResponse: formatResponse,
          className: className,
          body: body.toString(),
          headers: dio.options.headers,
          queryParameters: dio.options.queryParameters.toString(),
          response: error,
          time: time,
          isError: true,
          otherCatch: true,
        );
      }
    }
  }
}
