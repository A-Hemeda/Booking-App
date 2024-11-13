
import 'package:hotels_booking_app/data/Filter/models/Filter/Search/hotel.dart';

import '../../Auth/models/login_model.dart';
import '../../Filter/models/Filter/Search/Link_model.dart';

class Booking {
  Booking({
    required this.status,
    required this.data,
  });
  late final Status status;
  late final BookingDataModel data;

  Booking.fromJson(Map<String, dynamic> json){
    status = Status.fromJson(json['status']);
    data = BookingDataModel.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status.toJson();
    _data['data'] = data.toJson();
    return _data;
  }
}

class Status {
  Status({
    required this.type,
  });
  late final String type;

  Status.fromJson(Map<String, dynamic> json){
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['type'] = type;
    return _data;
  }
}

class BookingDataModel {
  BookingDataModel({
    required this.currentPage,
    required this.data,
    required this.firstPageUrl,
    required this.from,
    required this.lastPage,
    required this.lastPageUrl,
    required this.links,
    this.nextPageUrl,
    required this.path,
    required this.perPage,
    this.prevPageUrl,
    required this.to,
    required this.total,
  });
  late final int currentPage;
  late final List<BookingData> data;
  late final String firstPageUrl;
  late final int from;
  late final int lastPage;
  late final String lastPageUrl;
  late final List<Link> links;
  late final Null nextPageUrl;
  late final String path;
  late final String perPage;
  late final Null prevPageUrl;
  late final int to;
  late final int total;

  BookingDataModel.fromJson(Map<String, dynamic> json){
    currentPage = json['current_page'];
    data = List.from(json['data']).map((e)=>BookingData.fromJson(e)).toList();
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    links = List.from(json['links']).map((e)=>Link.fromJson(e)).toList();
    nextPageUrl = null;
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = null;
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['current_page'] = currentPage;
    _data['data'] = data.map((e)=>e.toJson()).toList();
    _data['first_page_url'] = firstPageUrl;
    _data['from'] = from;
    _data['last_page'] = lastPage;
    _data['last_page_url'] = lastPageUrl;
    _data['links'] = links.map((e)=>e.toJson()).toList();
    _data['next_page_url'] = nextPageUrl;
    _data['path'] = path;
    _data['per_page'] = perPage;
    _data['prev_page_url'] = prevPageUrl;
    _data['to'] = to;
    _data['total'] = total;
    return _data;
  }
}
class BookingData {
  BookingData({
    required this.id,
    required this.userId,
    required this.hotelId,
    required this.type,
    required this.createdAt,
    required this.updatedAt,
   // required this.user,
    required this.hotel,
  });
  late final int id;
  late final String userId;
  late final String hotelId;
  late final String type;
  late final String createdAt;
  late final String updatedAt;
  late final userData user;
  late final Hotel hotel;

  BookingData.fromJson(Map<String, dynamic> json){
    id = json['id'];
    userId = json['user_id'];
    hotelId = json['hotel_id'];
    type = json['type'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    user = userData.fromJson(json['user']);
    hotel = Hotel.fromJson(json['hotel']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['user_id'] = userId;
    _data['hotel_id'] = hotelId;
    _data['type'] = type;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
   // _data['user'] = user.toJson();
    _data['hotel'] = hotel.toJson();
    return _data;
  }
}


