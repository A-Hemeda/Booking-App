import '../Status_model.dart';
import 'hotelSearchData_model.dart';

class hotelsSearch {
  Status? status;
  hotelsSearchData? data;

  hotelsSearch({this.status, this.data});

  hotelsSearch.fromJson(Map<String, dynamic> json) {
    status =
    json['status'] != null ? new Status.fromJson(json['status']) : null;
    data = json['data'] != null ? new hotelsSearchData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.status != null) {
      data['status'] = this.status!.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}