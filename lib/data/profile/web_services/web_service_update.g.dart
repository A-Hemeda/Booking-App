// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'web_service_update.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _WebServiceUpdate implements WebServiceUpdate {
  _WebServiceUpdate(this._dio, {this.baseUrl}) {
    baseUrl ??= 'http://api.mahmoudtaha.com/api/auth/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<Update_response> getUpdateresponse(
      {required token, required name, required email, required image}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'token': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = {'name': name, 'email': email, 'image': await MultipartFile.fromFile(
      image.path,
      filename: Uri.file(image.path).pathSegments.last,
    ),


    };
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<Update_response>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, 'update-info',
                    queryParameters: queryParameters, data: FormData.fromMap(_data))
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Update_response.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
