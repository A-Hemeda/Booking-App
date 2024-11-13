
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/profile_info.dart';

part 'web_service.g.dart';

@RestApi(baseUrl: "http://api.mahmoudtaha.com/api/auth/")
abstract class WebService {
  factory WebService(Dio dio, {String baseUrl}) = _WebService;

  @GET("profile-info")
  Future<Profile_info> getProfileInfo({
    @Header("token") required String token,
  });
}
