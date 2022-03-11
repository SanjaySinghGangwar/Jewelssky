
class SelectCollectionResponse {
  int? messageId;
  String? message;
  List<Data>? data;

  SelectCollectionResponse({this.messageId, this.message, this.data});

  SelectCollectionResponse.fromJson(Map<String, dynamic> json) {
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
  int? colId;
  String? collectionName;
  String? collCode;
  String? collPrifix;
  String? image;
  String? crdt;
  int? prodId;
  int? isActive;
  String? slugify;

  Data(
      {this.colId,
        this.collectionName,
        this.collCode,
        this.collPrifix,
        this.image,
        this.crdt,
        this.prodId,
        this.isActive,
        this.slugify});

  Data.fromJson(Map<String, dynamic> json) {
    colId = json['col_id'];
    collectionName = json['Collection_Name'];
    collCode = json['coll_code'];
    collPrifix = json['Coll_Prifix'];
    image = json['Image'];
    crdt = json['crdt'];
    prodId = json['prod_id'];
    isActive = json['IsActive'];
    slugify = json['slugify'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['col_id'] = this.colId;
    data['Collection_Name'] = this.collectionName;
    data['coll_code'] = this.collCode;
    data['Coll_Prifix'] = this.collPrifix;
    data['Image'] = this.image;
    data['crdt'] = this.crdt;
    data['prod_id'] = this.prodId;
    data['IsActive'] = this.isActive;
    data['slugify'] = this.slugify;
    return data;
  }
}