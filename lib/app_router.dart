
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotels_booking_app/busieness_logic/BookingCubit/booking_cubit.dart';
import 'package:hotels_booking_app/data/Booking/models/booking_%20model.dart';
import 'package:hotels_booking_app/data/Filter/models/Filter/Search/hotel.dart';
import 'package:hotels_booking_app/injection/injection.dart';
import 'package:hotels_booking_app/presentation/Booking/screens/booking_screen.dart';
import 'package:hotels_booking_app/presentation/Booking/screens/trips_screen.dart';
import 'package:hotels_booking_app/presentation/Filter/screens/home/home_explore_screen.dart';

import 'constants/strings.dart';

class AppRouter {


  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case tripsScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) => getIt<BookingCubit>(),
            child: HomeExploreScreen(animationController: econtroller,),
          ),
        );
      case bookingRoute:
        final hotel = settings.arguments as Hotel;

        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) =>
               getIt<BookingCubit>(),
            child:HotelDetailes(hotelData: hotel,)
          ),
        );
    }
  }
}
