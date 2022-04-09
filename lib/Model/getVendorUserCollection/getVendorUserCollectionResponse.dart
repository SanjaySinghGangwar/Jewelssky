class getVendorUserCollectionResponse {
  String? collType;
  String? createdDate;
  int? id;

  getVendorUserCollectionResponse({this.collType, this.createdDate, this.id});

  getVendorUserCollectionResponse.fromJson(Map<String, dynamic> json) {
    collType = json['coll_type'];
    createdDate = json['created_date'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['coll_type'] = this.collType;
    data['created_date'] = this.createdDate;
    data['id'] = this.id;
    return data;
  }
}