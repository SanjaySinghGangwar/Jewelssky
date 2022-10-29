class GetProdductRecordResponse {
  int? messageId;
  String? message;
  Data? data;

  GetProdductRecordResponse({this.messageId, this.message, this.data});

  GetProdductRecordResponse.fromJson(Map<String, dynamic> json) {
    messageId = json['MessageId'];
    message = json['Message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['MessageId'] = this.messageId;
    data['Message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? jobNo;
  String? designno;
  int? collId;
  int? catId;
  int? scatId;
  int? proId;
  int? cultId;
  String? purity;
  double? wast;
  double? mkg;
  double? gwt;
  double? nwt;
  String? orderTime;
  int? certId;
  int? mkType;
  int? mntColor;

  Data(
      {this.jobNo,
        this.designno,
        this.collId,
        this.catId,
        this.scatId,
        this.proId,
        this.cultId,
        this.purity,
        this.wast,
        this.mkg,
        this.gwt,
        this.nwt,
        this.orderTime,
        this.certId,
        this.mkType,
        this.mntColor});

  Data.fromJson(Map<String, dynamic> json) {
    jobNo = json['job_no'];
    designno = json['designno'];
    collId = json['coll_id'];
    catId = json['cat_id'];
    scatId = json['scat_id'];
    proId = json['pro_id'];
    cultId = json['cult_id'];
    purity = json['purity'];
    wast = json['wast'];
    mkg = json['mkg'];
    gwt = json['gwt'];
    nwt = json['nwt'];
    orderTime = json['order_time'];
    certId = json['cert_id'];
    mkType = json['Mk_Type'];
    mntColor = json['Mnt_Color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['job_no'] = this.jobNo;
    data['designno'] = this.designno;
    data['coll_id'] = this.collId;
    data['cat_id'] = this.catId;
    data['scat_id'] = this.scatId;
    data['pro_id'] = this.proId;
    data['cult_id'] = this.cultId;
    data['purity'] = this.purity;
    data['wast'] = this.wast;
    data['mkg'] = this.mkg;
    data['gwt'] = this.gwt;
    data['nwt'] = this.nwt;
    data['order_time'] = this.orderTime;
    data['cert_id'] = this.certId;
    data['Mk_Type'] = this.mkType;
    data['Mnt_Color'] = this.mntColor;
    return data;
  }
}