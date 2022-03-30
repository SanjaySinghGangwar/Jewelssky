import 'dart:ffi';

class jobWiseMaterialDetailsResponse {
  int? messageId;
  String? message;
  List<Data>? data;

  jobWiseMaterialDetailsResponse({this.messageId, this.message, this.data});

  jobWiseMaterialDetailsResponse.fromJson(Map<String, dynamic> json) {
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
  int? jobNo;
  String? materialType;
  int? materialId;
  String? shape;
  int? shapeId;
  String? quality;
  int? qtyId;
  String? color;
  int? colorId;
  String? size;
  int? sizeId;
  int? settId;
  String? setting;
  int? pcs;
  double? ctw;
  double? pointer;
  String? voucherNo;
  double? diamondRate;
  double? diamondAmt;
  int? cutId;
  int? polishId;
  int? symmertryId;
  int? flurescentId;
  double? stable;
  double? sdepth;
  String? smeasurement;
  String? cutName;
  String? polishName;
  String? symmetryName;
  String? fluresentName;
  String? supplier;
  int? brandId;
  String? vendorId;

  Data(
      {this.id,
        this.jobNo,
        this.materialType,
        this.materialId,
        this.shape,
        this.shapeId,
        this.quality,
        this.qtyId,
        this.color,
        this.colorId,
        this.size,
        this.sizeId,
        this.settId,
        this.setting,
        this.pcs,
        this.ctw,
        this.pointer,
        this.voucherNo,
        this.diamondRate,
        this.diamondAmt,
        this.cutId,
        this.polishId,
        this.symmertryId,
        this.flurescentId,
        this.stable,
        this.sdepth,
        this.smeasurement,
        this.cutName,
        this.polishName,
        this.symmetryName,
        this.fluresentName,
        this.supplier,
        this.brandId,
        this.vendorId});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    jobNo = json['Job_no'];
    materialType = json['Material_Type'];
    materialId = json['Material_id'];
    shape = json['Shape'];
    shapeId = json['shape_id'];
    quality = json['Quality'];
    qtyId = json['Qty_id'];
    color = json['Color'];
    colorId = json['Color_id'];
    size = json['Size'];
    sizeId = json['Size_id'];
    settId = json['Sett_id'];
    setting = json['Setting'];
    pcs = json['Pcs'];
    ctw = json['ctw'];
    pointer = json['Pointer'];
    voucherNo = json['Voucher_No'];
    diamondRate = json['Diamond_Rate'];
    diamondAmt = json['Diamond_Amt'];
    cutId = json['cut_id'];
    polishId = json['polish_id'];
    symmertryId = json['symmertry_id'];
    flurescentId = json['flurescent_id'];
    stable = json['stable'];
    sdepth = json['sdepth'];
    smeasurement = json['smeasurement'];
    cutName = json['cut_name'];
    polishName = json['polish_name'];
    symmetryName = json['symmetry_name'];
    fluresentName = json['fluresent_name'];
    supplier = json['Supplier'];
    brandId = json['Brand_id'];
    vendorId = json['vendor_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['Job_no'] = this.jobNo;
    data['Material_Type'] = this.materialType;
    data['Material_id'] = this.materialId;
    data['Shape'] = this.shape;
    data['shape_id'] = this.shapeId;
    data['Quality'] = this.quality;
    data['Qty_id'] = this.qtyId;
    data['Color'] = this.color;
    data['Color_id'] = this.colorId;
    data['Size'] = this.size;
    data['Size_id'] = this.sizeId;
    data['Sett_id'] = this.settId;
    data['Setting'] = this.setting;
    data['Pcs'] = this.pcs;
    data['ctw'] = this.ctw;
    data['Pointer'] = this.pointer;
    data['Voucher_No'] = this.voucherNo;
    data['Diamond_Rate'] = this.diamondRate;
    data['Diamond_Amt'] = this.diamondAmt;
    data['cut_id'] = this.cutId;
    data['polish_id'] = this.polishId;
    data['symmertry_id'] = this.symmertryId;
    data['flurescent_id'] = this.flurescentId;
    data['stable'] = this.stable;
    data['sdepth'] = this.sdepth;
    data['smeasurement'] = this.smeasurement;
    data['cut_name'] = this.cutName;
    data['polish_name'] = this.polishName;
    data['symmetry_name'] = this.symmetryName;
    data['fluresent_name'] = this.fluresentName;
    data['Supplier'] = this.supplier;
    data['Brand_id'] = this.brandId;
    data['vendor_id'] = this.vendorId;
    return data;
  }
}