import 'package:hotels_booking_app/data/Booking/models/booking_%20model.dart';
import 'package:hotels_booking_app/data/Booking/models/response_model.dart';

class BookingState{}
class loadingbookingstate extends BookingState{}
class InitialBooking extends BookingState{}

class BookingCreated extends BookingState{
  final StatusResponse response;

  BookingCreated(this.response);
}

class BookingUpdated extends BookingState {
  final StatusResponse response;

  BookingUpdated(this.response);

}

class BookingLoaded extends BookingState {
  final Booking booking ;

  BookingLoaded(this.booking);

}
