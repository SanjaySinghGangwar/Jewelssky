class MaterialTypeResponse {
  int? messageId;
  String? message;
  List<Data>? data;

  MaterialTypeResponse({this.messageId, this.message, this.data});

  MaterialTypeResponse.fromJson(Map<String, dynamic> json) {
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
  int? materialId;
  String? materialName;

  Data({this.materialId, this.materialName});

  Data.fromJson(Map<String, dynamic> json) {
    materialId = json['material_id'];
    materialName = json['Material_Name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['material_id'] = this.materialId;
    data['Material_Name'] = this.materialName;
    return data;
  }
}