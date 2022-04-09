class OrderStockResponse {
  int? messageId;
  String? message;
  List<Data>? data;

  OrderStockResponse({this.messageId, this.message, this.data});

  OrderStockResponse.fromJson(Map<String, dynamic> json) {
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
  int? jobNo;
  String? imgpath;
  String? designno;
  String? stockType;
  double? gwt;
  String? processId;
  double? nwt;
  String? purity;
  String? proEname;
  String? collectionName;
  String? categoryName;
  String? cultNm;
  String? matel;
  String? entryDt;
  int? discId;
  double? colorCtwWt;
  double? diwCtwWt;
  String? source;

  Data(
      {this.jobNo,
        this.imgpath,
        this.designno,
        this.stockType,
        this.gwt,
        this.processId,
        this.nwt,
        this.purity,
        this.proEname,
        this.collectionName,
        this.categoryName,
        this.cultNm,
        this.matel,
        this.entryDt,
        this.discId,
        this.colorCtwWt,
        this.diwCtwWt,
        this.source});

  Data.fromJson(Map<String, dynamic> json) {
    jobNo = json['job_no'];
    imgpath = json['imgpath'];
    designno = json['designno'];
    stockType = json['Stock_Type'];
    gwt = json['gwt'];
    processId = json['process_id'];
    nwt = json['nwt'];
    purity = json['purity'];
    proEname = json['pro_ename'];
    collectionName = json['Collection_Name'];
    categoryName = json['Category_Name'];
    cultNm = json['cult_nm'];
    matel = json['Matel'];
    entryDt = json['entry_dt'];
    discId = json['disc_id'];
    colorCtwWt = json['color_Ctw_wt'];
    diwCtwWt = json['diw_ctw_wt'];
    source = json['Source'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['job_no'] = this.jobNo;
    data['imgpath'] = this.imgpath;
    data['designno'] = this.designno;
    data['Stock_Type'] = this.stockType;
    data['gwt'] = this.gwt;
    data['process_id'] = this.processId;
    data['nwt'] = this.nwt;
    data['purity'] = this.purity;
    data['pro_ename'] = this.proEname;
    data['Collection_Name'] = this.collectionName;
    data['Category_Name'] = this.categoryName;
    data['cult_nm'] = this.cultNm;
    data['Matel'] = this.matel;
    data['entry_dt'] = this.entryDt;
    data['disc_id'] = this.discId;
    data['color_Ctw_wt'] = this.colorCtwWt;
    data['diw_ctw_wt'] = this.diwCtwWt;
    data['Source'] = this.source;
    return data;
  }
}