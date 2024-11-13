import '../Status_model.dart';
import 'facilitiesData_model.dart';

class getFacilities {
  Status? status;
  List<faciltiesData >? data;

  getFacilities({this.status, this.data});

  getFacilities.fromJson(Map<String, dynamic> json) {
    status =
    json['status'] != null ? new Status.fromJson(json['status']) : null;
    if (json['data'] != null) {
      data = <faciltiesData >[];
      json['data'].forEach((v) {
        data!.add(new faciltiesData .fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.status != null) {
      data['status'] = this.status!.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}