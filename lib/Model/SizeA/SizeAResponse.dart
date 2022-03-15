class SizeAResponse {
  int? messageId;
  String? message;
  List<Data>? data;

  SizeAResponse({this.messageId, this.message, this.data});

  SizeAResponse.fromJson(Map<String, dynamic> json) {
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
  int? matSizId;
  int? materialId;
  int? shapeId;
  String? size;

  Data({this.matSizId, this.materialId, this.shapeId, this.size});

  Data.fromJson(Map<String, dynamic> json) {
    matSizId = json['mat_siz_id'];
    materialId = json['material_id'];
    shapeId = json['Shape_id'];
    size = json['Size'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mat_siz_id'] = this.matSizId;
    data['material_id'] = this.materialId;
    data['Shape_id'] = this.shapeId;
    data['Size'] = this.size;
    return data;
  }
}