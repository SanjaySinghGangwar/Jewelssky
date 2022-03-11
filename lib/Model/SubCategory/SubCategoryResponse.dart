class SubCategoryResponse {
  int? messageId;
  String? message;
  List<Data>? data;

  SubCategoryResponse({this.messageId, this.message, this.data});

  SubCategoryResponse.fromJson(Map<String, dynamic> json) {
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
  int? sCatId;
  int? colId;
  int? catId;
  String? subCatName;
  String? subCatCode;
  String? scatPrifix;
  String? status;
  String? image;
  int? displayOrder;
  String? crtdt;

  Data(
      {this.sCatId,
        this.colId,
        this.catId,
        this.subCatName,
        this.subCatCode,
        this.scatPrifix,
        this.status,
        this.image,
        this.displayOrder,
        this.crtdt});

  Data.fromJson(Map<String, dynamic> json) {
    sCatId = json['s_cat_id'];
    colId = json['col_id'];
    catId = json['cat_id'];
    subCatName = json['Sub_Cat_Name'];
    subCatCode = json['sub_cat_code'];
    scatPrifix = json['Scat_Prifix'];
    status = json['Status'];
    image = json['Image'];
    displayOrder = json['display_order'];
    crtdt = json['crtdt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['s_cat_id'] = this.sCatId;
    data['col_id'] = this.colId;
    data['cat_id'] = this.catId;
    data['Sub_Cat_Name'] = this.subCatName;
    data['sub_cat_code'] = this.subCatCode;
    data['Scat_Prifix'] = this.scatPrifix;
    data['Status'] = this.status;
    data['Image'] = this.image;
    data['display_order'] = this.displayOrder;
    data['crtdt'] = this.crtdt;
    return data;
  }
}