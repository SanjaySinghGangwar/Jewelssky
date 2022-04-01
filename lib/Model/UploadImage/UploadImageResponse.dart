class UploadImageResponse {
  int? messageId;
  String? message;

  UploadImageResponse({this.messageId, this.message});

  UploadImageResponse.fromJson(Map<String, dynamic> json) {
    messageId = json['MessageId'];
    message = json['Message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['MessageId'] = this.messageId;
    data['Message'] = this.message;
    return data;
  }
}