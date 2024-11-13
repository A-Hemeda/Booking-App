// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_webServices.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _BookingWebServices implements BookingWebServices {
  _BookingWebServices(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'http://api.mahmoudtaha.com/api/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<StatusResponse> createBooking({
    required token,
    required hotelId,
  }) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'token': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = {'hotel_id': hotelId};
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<StatusResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'create-booking',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = StatusResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<StatusResponse> updateBookingStatus({
    required bookingId,
    required type,
  }) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'booking_id': bookingId,
      'type': type,
    };
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<StatusResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'update-booking-status',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = StatusResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<Booking> getMyBooking(
    type,
    count,
    token,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'type': type,
      r'count': count,
    };
    final _headers = <String, dynamic>{r'token': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result =
        await _dio.fetch<Map<String, dynamic>>(_setStreamType<Booking>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'get-bookings',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Booking.fromJson(_result.data!);
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
