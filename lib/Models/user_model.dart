class LoginModel {
  late bool status;
  String? message;
  UserData? data;
  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = UserData.fromJson(json['data']);
  }
}

class UserData {
  int? id;
  var name;
  String? email;
  String? password;
  String? phone;
  String? image;
  var token;
  int? points;
  int? credit;
  UserData(
      {this.password,
      this.email,
      this.id,
      this.image,
      this.credit,
      this.phone,
      this.points,
      this.token});
  UserData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    token = json['token'];
    points = json['points'];
    phone = json['phone'];
    image = json['image'];
    password = json['password'];
    credit = json['credit'];
  }
}
