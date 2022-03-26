class AddSpecificationResponse {
  int? messageId;
  String? message;
  String? msg;
  double? wwt;

  AddSpecificationResponse({this.messageId, this.message, this.msg, this.wwt});

  AddSpecificationResponse.fromJson(Map<String, dynamic> json) {
    messageId = json['MessageId'];
    message = json['Message'];
    msg = json['msg'];
    wwt = json['wwt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['MessageId'] = this.messageId;
    data['Message'] = this.message;
    data['msg'] = this.msg;
    data['wwt'] = this.wwt;
    return data;
  }
}