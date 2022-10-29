class getProductListForEditRequest {
  String? userId;
  String? tval;

  getProductListForEditRequest({this.userId, this.tval});

  getProductListForEditRequest.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    tval = json['tval'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['tval'] = this.tval;
    return data;
  }
}