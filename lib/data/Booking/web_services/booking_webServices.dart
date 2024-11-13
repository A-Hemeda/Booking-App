import 'package:dio/dio.dart';
import 'package:hotels_booking_app/data/Booking/models/booking_%20model.dart';
import 'package:hotels_booking_app/data/Booking/models/response_model.dart';

import 'package:retrofit/http.dart';


part  'booking_webServices.g.dart';

@RestApi(baseUrl: "http://api.mahmoudtaha.com/api/")
abstract class BookingWebServices{
  factory BookingWebServices(Dio dio, {String baseUrl}) = _BookingWebServices;

  @POST("create-booking")
  Future<StatusResponse> createBooking({
    @Header("token") required String token,
    @Field("hotel_id") required int hotelId,
  });

  @POST("update-booking-status")
  Future<StatusResponse> updateBookingStatus({
    @Field("booking_id") required int bookingId,
    @Field("type") required String type,
  });

  @GET("get-bookings")
  Future<Booking> getMyBooking(
      @Query("type") String type,
      @Query("count") int count ,@Header("token") String token);
}