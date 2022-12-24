class ChaneFavoriteModel {
  late bool status;
  late String message;
  ChaneFavoriteModel.fromJason(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
  }
}
