class MWCollectionResponse {
  int? messageId;
  String? message;
  List<Data>? data;

  MWCollectionResponse({this.messageId, this.message, this.data});

  MWCollectionResponse.fromJson(Map<String, dynamic> json) {
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
  String? vendorId;
  String? collType;
  String? createdBy;
  String? createdDate;
  bool? collSt;

  Data(
      {this.id,
        this.vendorId,
        this.collType,
        this.createdBy,
        this.createdDate,
        this.collSt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    vendorId = json['vendor_id'];
    collType = json['coll_type'];
    createdBy = json['created_by'];
    createdDate = json['created_date'];
    collSt = json['coll_st'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['vendor_id'] = this.vendorId;
    data['coll_type'] = this.collType;
    data['created_by'] = this.createdBy;
    data['created_date'] = this.createdDate;
    data['coll_st'] = this.collSt;
    return data;
  }
}