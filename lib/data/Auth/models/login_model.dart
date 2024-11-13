class LoginModel{
  statusData? status;
  userData? data;

  LoginModel({this.status,this.data});

  LoginModel.fromJson(Map<String, dynamic> json)
  {
    status = json['status'] != null ? statusData.fromJson(json['status']) : null;
    data = json['data'] != null ? userData.fromJson(json['data']) : null;
  }


}

class userData{
  int? id;
  String? name;
  String? email;
  String? email_verified_at;
  String? api_token;
  String? image;
  String? updatedAt;
  String? createdAt;
  String? google_id;
  String? provider;

  userData({
    this.id,
    this.name,
    this.email,
    this.email_verified_at,
    this.api_token,
    this.image,
    this.createdAt,
    this.updatedAt,
    this.google_id,
    this.provider,
  });

  userData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    email_verified_at = json['email_verified_at'];
    api_token = json['api_token'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    createdAt = json['google_id'];
    createdAt = json['provider'];
  }

}

class statusData{
  String? type;
  titleData? title;

  statusData({this.type,this.title});

  statusData.fromJson(Map<String, dynamic> json)
  {
    type = json['type'];
    title = json['title'] != null ? titleData.fromJson(json['title']) : null;
  }

}

class titleData{
  String? ar;
  String? en;

  titleData({this.ar, this.en,});

  titleData.fromJson(Map<String, dynamic> json) {
    ar = json['ar'];
    en = json['en'];
  }
}