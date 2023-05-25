// ignore: camel_case_types
class categories {
  String? name;
  String? createdBy;
  String? updatedBy;
  String? createdAt;
  String? updatedAt;

  categories(
      {this.name,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt});

  categories.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['created_by'] = createdBy;
    data['updated_by'] = updatedBy;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
