class Branche {
  String? name;
  String? phone;
  String? email;
  String? address;
  String? status;
  String? createdAt;
  String? createdByUserId;
  String? updatedAt;
  String? updatdByUserId;

  Branche(
      {this.name,
      this.phone,
      this.email,
      this.address,
      this.status,
      this.createdAt,
      this.createdByUserId,
      this.updatedAt,
      this.updatdByUserId});

  Branche.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    address = json['address'];
    status = json['status'];
    createdAt = json['created_at'];
    createdByUserId = json['created_by_user_id'];
    updatedAt = json['updated_at'];
    updatdByUserId = json['updatd_by_user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['phone'] = phone;
    data['email'] = email;
    data['address'] = address;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['created_by_user_id'] = createdByUserId;
    data['updated_at'] = updatedAt;
    data['updatd_by_user_id'] = updatdByUserId;
    return data;
  }
}
