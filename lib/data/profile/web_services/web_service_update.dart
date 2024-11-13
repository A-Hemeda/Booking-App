import 'dart:io';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:retrofit/retrofit.dart';

import '../models/Update_info.dart';


part 'web_service_update.g.dart';


@RestApi(baseUrl: "http://api.mahmoudtaha.com/api/auth/")
abstract class WebServiceUpdate {
  factory WebServiceUpdate(Dio dio, {String baseUrl}) = _WebServiceUpdate;


  @POST("update-info")
  Future<Update_response> getUpdateresponse({
    @Header("token") required String token,
    @Field("name") required String name,
    @Field("email") required String email,
    @Field("image") required XFile image,
  });

}
