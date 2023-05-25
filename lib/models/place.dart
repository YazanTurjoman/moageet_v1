class Place {
  String? name;
  String? address;
  String? phone;
  String? email;
  String? webAddress;
  String? createdAt;
  String? createdBy;
  String? updateAt;
  String? updatedBy;

  Place(
      {this.name,
      this.address,
      this.phone,
      this.email,
      this.webAddress,
      this.createdAt,
      this.createdBy,
      this.updateAt,
      this.updatedBy});

  Place.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    address = json['address'];
    phone = json['phone'];
    email = json['email'];
    webAddress = json['web_address'];
    createdAt = json['created_at'];
    createdBy = json['created_by'];
    updateAt = json['update_at'];
    updatedBy = json['updated_by'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['address'] = address;
    data['phone'] = phone;
    data['email'] = email;
    data['web_address'] = webAddress;
    data['created_at'] = createdAt;
    data['created_by'] = createdBy;
    data['update_at'] = updateAt;
    data['updated_by'] = updatedBy;
    return data;
  }
}
