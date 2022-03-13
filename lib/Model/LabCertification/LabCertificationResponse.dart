class LabCertificationResponse {
  int? messageId;
  String? message;
  List<Data>? data;

  LabCertificationResponse({this.messageId, this.message, this.data});

  LabCertificationResponse.fromJson(Map<String, dynamic> json) {
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
  int? certId;
  String? ceriCode;
  String? certiName;

  Data({this.certId, this.ceriCode, this.certiName});

  Data.fromJson(Map<String, dynamic> json) {
    certId = json['cert_id'];
    ceriCode = json['Ceri_Code'];
    certiName = json['Certi_Name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cert_id'] = this.certId;
    data['Ceri_Code'] = this.ceriCode;
    data['Certi_Name'] = this.certiName;
    return data;
  }
}