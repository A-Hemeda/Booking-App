class faciltiesData {
  int? id;
  String? name;
  String? image;
  String? createdAt;
  String? updatedAt;

  faciltiesData ({this.id, this.name, this.image, this.createdAt, this.updatedAt});

  faciltiesData .fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}