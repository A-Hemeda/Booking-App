
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'dart:convert';
import '../../models/Filter/Get facilities/facilities_model.dart';
import '../../models/Filter/Search/hotelsSearch_model.dart';
part 'web_services.g.dart';
@RestApi(baseUrl: "http://api.mahmoudtaha.com/api/")
abstract class webServices{

  factory webServices(Dio dio, {String baseUrl}) = _webServices;

  @GET("facilities")
  Future<getFacilities> getAllFacilities();
  @GET("search-hotels")
  Future<hotelsSearch> getAllHotels();
   @GET("search-hotels")
   Future<hotelsSearch> searchHotels(

       @Query("name") var name,
       @Query("address") var address,
       @Query("max_price") var maxprice,
       @Query("min_price") var minprice,

       @Query("facilities[0]") var facilities1,

       @Query("latitude") var latitude,
       @Query("longitude") var longitude,
       @Query("distance") var distance,
       @Query("count") var count,
       @Query("page") var page,
       );





}

Dio createAndsetupDio()
{ Dio dio= Dio();

// dio
//   ..options.connectTimeout=19*1000
//   ..options.receiveTimeout=19*1000;
dio.interceptors.add(
    LogInterceptor(

        requestBody: true,
        error: true,
        requestHeader: false,
        request: true,
        responseBody: true

    ));
return dio;



}

