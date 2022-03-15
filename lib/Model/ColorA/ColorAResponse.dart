class ColorAResponse {
  int? messageId;
  String? message;
  List<Data>? data;

  ColorAResponse({this.messageId, this.message, this.data});

  ColorAResponse.fromJson(Map<String, dynamic> json) {
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
  int? matColId;
  int? materialId;
  String? color;

  Data({this.matColId, this.materialId, this.color});

  Data.fromJson(Map<String, dynamic> json) {
    matColId = json['Mat_col_id'];
    materialId = json['material_id'];
    color = json['Color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Mat_col_id'] = this.matColId;
    data['material_id'] = this.materialId;
    data['Color'] = this.color;
    return data;
  }
}