// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'web_services.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _webServices implements webServices {
  _webServices(this._dio, {this.baseUrl}) {
    baseUrl ??= 'http://api.mahmoudtaha.com/api/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<getFacilities> getAllFacilities() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<getFacilities>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'facilities',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = getFacilities.fromJson(_result.data!);
    return value;
  }
  @override
  Future<hotelsSearch> getAllHotels() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<getFacilities>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'search-hotels',
                queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = hotelsSearch.fromJson(_result.data!);
    return value;
  }

  @override
  Future<hotelsSearch> searchHotels(
      name,
      address,
      maxprice,
      minprice,
      facilities1,


      latitude,
      longitude,
      distance,
      count,
      page) async {
    const _extra = <String, dynamic>{};
    jsonEncode("facilities[0]");
    Map<String, dynamic> queryParameters = {
      if( name==null) r'name':{ }
      else  r'name': name,
    if( address==null) r'address':{ }
      else r'address': address,
      if( maxprice==null) r'max_price': {}
     else  r'max_price': maxprice,
      if( minprice==null) r'min_price': {}
      else r'min_price': minprice,
      if( facilities1==null) Uri.decodeQueryComponent(r'facilities[0]'): {}
     else 'facilities[0]': facilities1,


      if( latitude==null) r'latitude': {}
      else r'latitude': latitude,
      if( longitude==null) r'longitude': {}
     else  r'longitude': longitude,
      if( distance==null) r'distance': {}
     else r'distance': distance,
      if( count==null) r'count': {}
     else  r'count': count,
      if( page==null) r'page': {}
     else r'page': page
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<hotelsSearch>(
            Options(

                method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'search-hotels',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));

    final value = hotelsSearch.fromJson(_result.data!);
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
