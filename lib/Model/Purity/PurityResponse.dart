class PurityResponse {
  int? messageId;
  String? message;
  List<Data>? data;

  PurityResponse({this.messageId, this.message, this.data});

  PurityResponse.fromJson(Map<String, dynamic> json) {
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
  int? id;
  String? matCode;
  int? mtid;
  String? purity;
  double? purityRatio;

  Data({this.id, this.matCode, this.mtid, this.purity, this.purityRatio});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    matCode = json['Mat_Code'];
    mtid = json['mtid'];
    purity = json['Purity'];
    purityRatio = json['Purity_Ratio'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['Mat_Code'] = this.matCode;
    data['mtid'] = this.mtid;
    data['Purity'] = this.purity;
    data['Purity_Ratio'] = this.purityRatio;
    return data;
  }
}