class MetalColorResponse {
  int? messageId;
  String? message;
  List<Data>? data;

  MetalColorResponse({this.messageId, this.message, this.data});

  MetalColorResponse.fromJson(Map<String, dynamic> json) {
    messageId = json['MessageId'];
    message = json['Message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['MessageId'] = this.messageId;
    data['Message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? mcolid;
  String? colorCode;
  String? color;
  String? remark;

  Data({this.mcolid, this.colorCode, this.color, this.remark});

  Data.fromJson(Map<String, dynamic> json) {
    mcolid = json['mcolid'];
    colorCode = json['color_code'];
    color = json['color'];
    remark = json['remark'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mcolid'] = this.mcolid;
    data['color_code'] = this.colorCode;
    data['color'] = this.color;
    data['remark'] = this.remark;
    return data;
  }
}