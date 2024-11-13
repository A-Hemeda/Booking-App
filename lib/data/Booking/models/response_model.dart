class StatusResponse {
  StatusResponse({
    required this.status,
  });
  late final Status status;

  StatusResponse.fromJson(Map<String, dynamic> json){
    status = Status.fromJson(json['status']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status.toJson();
    return _data;
  }
}

class Status {
  Status({
    required this.type,
    required this.title,
  });
  late final String type;
  late final Title title;

  Status.fromJson(Map<String, dynamic> json){
    type = json['type'];
    title = Title.fromJson(json['title']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['type'] = type;
    _data['title'] = title.toJson();
    return _data;
  }
}

class Title {
  Title({
    required this.ar,
    required this.en,
  });
  late final String ar;
  late final String en;

  Title.fromJson(Map<String, dynamic> json){
    ar = json['ar'];
    en = json['en'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['ar'] = ar;
    _data['en'] = en;
    return _data;
  }
}