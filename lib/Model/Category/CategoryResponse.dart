class CategoryResponse {
  int? messageId;
  String? message;
  List<Data>? data;

  CategoryResponse({this.messageId, this.message, this.data});

  CategoryResponse.fromJson(Map<String, dynamic> json) {
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
  int? catId;
  int? colId;
  String? categoryName;
  String? catCode;
  String? catPrifix;
  String? status;
  String? slugify;
  String? image;
  String? crtdt;

  Data(
      {this.catId,
        this.colId,
        this.categoryName,
        this.catCode,
        this.catPrifix,
        this.status,
        this.slugify,
        this.image,
        this.crtdt});

  Data.fromJson(Map<String, dynamic> json) {
    catId = json['cat_id'];
    colId = json['col_id'];
    categoryName = json['Category_Name'];
    catCode = json['cat_code'];
    catPrifix = json['cat_prifix'];
    status = json['Status'];
    slugify = json['slugify'];
    image = json['Image'];
    crtdt = json['crtdt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cat_id'] = this.catId;
    data['col_id'] = this.colId;
    data['Category_Name'] = this.categoryName;
    data['cat_code'] = this.catCode;
    data['cat_prifix'] = this.catPrifix;
    data['Status'] = this.status;
    data['slugify'] = this.slugify;
    data['Image'] = this.image;
    data['crtdt'] = this.crtdt;
    return data;
  }
}