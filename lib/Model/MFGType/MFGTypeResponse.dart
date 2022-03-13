class MFGTypeResponse {
  int? messageId;
  String? message;
  List<Data>? data;

  MFGTypeResponse({this.messageId, this.message, this.data});

  MFGTypeResponse.fromJson(Map<String, dynamic> json) {
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
  int? mkType;
  String? mkTypeCode;
  String? mkTypeName;
  String? mkTypeDesc;

  Data({this.mkType, this.mkTypeCode, this.mkTypeName, this.mkTypeDesc});

  Data.fromJson(Map<String, dynamic> json) {
    mkType = json['Mk_Type'];
    mkTypeCode = json['Mk_Type_Code'];
    mkTypeName = json['Mk_Type_Name'];
    mkTypeDesc = json['Mk_Type_Desc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Mk_Type'] = this.mkType;
    data['Mk_Type_Code'] = this.mkTypeCode;
    data['Mk_Type_Name'] = this.mkTypeName;
    data['Mk_Type_Desc'] = this.mkTypeDesc;
    return data;
  }
}