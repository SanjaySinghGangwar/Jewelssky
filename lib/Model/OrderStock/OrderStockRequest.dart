class OrderStockRequest {
  String? ptype;
  String? coll;
  String? cat;
  String? scat;
  String? purity;
  String? userId;

  OrderStockRequest(
      {this.ptype, this.coll, this.cat, this.scat, this.purity, this.userId});

  OrderStockRequest.fromJson(Map<String, dynamic> json) {
    ptype = json['ptype'];
    coll = json['coll'];
    cat = json['cat'];
    scat = json['scat'];
    purity = json['purity'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ptype'] = this.ptype;
    data['coll'] = this.coll;
    data['cat'] = this.cat;
    data['scat'] = this.scat;
    data['purity'] = this.purity;
    data['user_id'] = this.userId;
    return data;
  }
}