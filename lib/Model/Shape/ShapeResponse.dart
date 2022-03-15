class ShapeResponse {
  int? messageId;
  String? message;
  List<Data>? data;

  ShapeResponse({this.messageId, this.message, this.data});

  ShapeResponse.fromJson(Map<String, dynamic> json) {
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
  int? shapeId;
  int? materialId;
  String? shape;

  Data({this.shapeId, this.materialId, this.shape});

  Data.fromJson(Map<String, dynamic> json) {
    shapeId = json['Shape_id'];
    materialId = json['material_id'];
    shape = json['Shape'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Shape_id'] = this.shapeId;
    data['material_id'] = this.materialId;
    data['Shape'] = this.shape;
    return data;
  }
}