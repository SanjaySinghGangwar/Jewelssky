class ProductTypeResponse {
  int? messageId;
  String? message;
  List<Data>? data;

  ProductTypeResponse({this.messageId, this.message, this.data});

  ProductTypeResponse.fromJson(Map<String, dynamic> json) {
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
  int? proId;
  String? proCode;
  String? prodType;
  String? proEname;
  String? prodPrefix;
  String? image;
  String? ecomActive;
  int? ecomDisplayOrder;
  bool? vendShowProd;

  Data({this.proId, this.proCode, this.prodType, this.proEname, this.prodPrefix, this.image, this.ecomActive, this.ecomDisplayOrder, this.vendShowProd});

  Data.fromJson(Map<String, dynamic> json) {
    proId = json['pro_id'];
    proCode = json['pro_code'];
    prodType = json['Prod_type'];
    proEname = json['pro_ename'];
    prodPrefix = json['Prod_Prefix'];
    image = json['Image'];
    ecomActive = json['Ecom_Active'];
    ecomDisplayOrder = json['ecom_display_order'];
    vendShowProd = json['vend_show_prod'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pro_id'] = this.proId;
    data['pro_code'] = this.proCode;
    data['Prod_type'] = this.prodType;
    data['pro_ename'] = this.proEname;
    data['Prod_Prefix'] = this.prodPrefix;
    data['Image'] = this.image;
    data['Ecom_Active'] = this.ecomActive;
    data['ecom_display_order'] = this.ecomDisplayOrder;
    data['vend_show_prod'] = this.vendShowProd;
    return data;
  }
}
