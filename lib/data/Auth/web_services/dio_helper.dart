import 'package:dio/dio.dart';

import '../../../constants/end_points.dart';


class DioHelper {

  static Dio? dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl:  baseURL,
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData(
      {required String url, required Map<String, dynamic> query}) async {
    return await dio!.get(url, queryParameters: query);
  }


  static Future<Response> postData({
    required String url,


    required Map<String, dynamic> body,
  }) async {
      print("fffffffffffffffff$url  $body");
    return await dio!.post(url, data: body);
  }
}