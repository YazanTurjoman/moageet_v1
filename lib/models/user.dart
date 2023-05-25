class User {
  String? name;
  String? username;
  String? isAdmin;
  String? userTypeId;
  String? status;
  String? email;
  String? password;
  String? rememberToken;
  String? createdAt;
  String? updateAt;

  User(
      {this.name,
      this.username,
      this.isAdmin,
      this.userTypeId,
      this.status,
      this.email,
      this.password,
      this.rememberToken,
      this.createdAt,
      this.updateAt});

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    username = json['username'];
    isAdmin = json['is_admin'];
    userTypeId = json['user_type_id'];
    status = json['status'];
    email = json['email'];
    password = json['password'];
    rememberToken = json['remember_token'];
    createdAt = json['created_at'];
    updateAt = json['update_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['username'] = username;
    data['is_admin'] = isAdmin;
    data['user_type_id'] = userTypeId;
    data['status'] = status;
    data['email'] = email;
    data['password'] = password;
    data['remember_token'] = rememberToken;
    data['created_at'] = createdAt;
    data['update_at'] = updateAt;
    return data;
  }
}
