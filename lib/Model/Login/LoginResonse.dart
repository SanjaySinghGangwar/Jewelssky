class LoginResonse {
  int? messageId;
  String? message;
  Null? data;

  LoginResonse({this.messageId, this.message, this.data});

  LoginResonse.fromJson(Map<String, dynamic> json) {
    messageId = json['MessageId'];
    message = json['Message'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['MessageId'] = this.messageId;
    data['Message'] = this.message;
    data['data'] = this.data;
    return data;
  }
}
