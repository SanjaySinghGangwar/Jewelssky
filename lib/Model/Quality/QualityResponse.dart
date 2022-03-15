class QualityResponse {
  int? messageId;
  String? message;
  List<Data>? data;

  QualityResponse({this.messageId, this.message, this.data});

  QualityResponse.fromJson(Map<String, dynamic> json) {
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
  int? matQtId;
  int? materialId;
  String? quality;

  Data({this.matQtId, this.materialId, this.quality});

  Data.fromJson(Map<String, dynamic> json) {
    matQtId = json['mat_qt_id'];
    materialId = json['material_id'];
    quality = json['Quality'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mat_qt_id'] = this.matQtId;
    data['material_id'] = this.materialId;
    data['Quality'] = this.quality;
    return data;
  }
}