class VerifyOtpResponse {
  int? messageId;
  String? message;
  Null? data;

  VerifyOtpResponse({this.messageId, this.message, this.data});

  VerifyOtpResponse.fromJson(Map<String, dynamic> json) {
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