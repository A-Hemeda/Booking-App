import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hotels_booking_app/busieness_logic/FilterCubit/cubit.dart';
import '../busieness_logic/BookingCubit/booking_cubit.dart';
import '../busieness_logic/ProfileCubit/cubit.dart';
import '../data/Booking/repository/booking_repo.dart';
import '../data/Booking/web_services/booking_webServices.dart';
import '../data/Filter/repository/FilterRepo/repository.dart';
import '../data/Filter/web_services/FilterWebsevices/web_services.dart';
import '../data/profile/rebo/profile_rebo.dart';
import '../data/profile/rebo/update_rebo.dart';
import '../data/profile/web_services/web_service.dart';
import '../data/profile/web_services/web_service_update.dart';

final getIt = GetIt.instance;

void initGetIt() {
  getIt.registerLazySingleton<FilterCubit>(() => FilterCubit(getIt()));
  getIt.registerLazySingleton<MyRepo>(() => MyRepo(getIt()));
  getIt.registerLazySingleton<webServices>(
      () => webServices(createAndsetupDio()));
}

void initGetIt2() {
  getIt.registerLazySingleton<ProfileCubit>(
      () => ProfileCubit(getIt(), getIt()));
  getIt.registerLazySingleton<UpdateRebo>(() => UpdateRebo(getIt()));
  getIt.registerLazySingleton<ProfileRebo>(() => ProfileRebo(getIt()));
  getIt
      .registerLazySingleton<WebService>(() => WebService(createAndsetupDio()));
  getIt.registerLazySingleton<WebServiceUpdate>(
      () => WebServiceUpdate(createAndsetupDio()));
}

void initBookingGetIt() {
  getIt.registerLazySingleton<BookingCubit>(() => BookingCubit(getIt()));
  getIt.registerLazySingleton<BookingRepo>(() => BookingRepo(getIt()));
  getIt.registerLazySingleton<BookingWebServices>(
      () => BookingWebServices(createAndsetupDio()));
}
