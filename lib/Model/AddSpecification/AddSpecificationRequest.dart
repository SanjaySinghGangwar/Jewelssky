class AddSpecificationRequest {
  String? userId;
  String? id;
  String? materialId;
  String? materialType;
  String? shape;
  String? shapeId;
  String? quality;
  String? qualityId;
  String? materialcolor;
  String? materialcolorId;
  String? matsize;
  String? matsizeId;
  String? sett;
  String? settNm;
  String? pcs;
  String? ctw;
  String? pointer;
  String? rate;
  String? dgno;
  String? geniid;

  AddSpecificationRequest(
      {this.userId,
        this.id,
        this.materialId,
        this.materialType,
        this.shape,
        this.shapeId,
        this.quality,
        this.qualityId,
        this.materialcolor,
        this.materialcolorId,
        this.matsize,
        this.matsizeId,
        this.sett,
        this.settNm,
        this.pcs,
        this.ctw,
        this.pointer,
        this.rate,
        this.dgno,
        this.geniid});

  AddSpecificationRequest.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    id = json['id'];
    materialId = json['Material_id'];
    materialType = json['Material_type'];
    shape = json['shape'];
    shapeId = json['shape_id'];
    quality = json['Quality'];
    qualityId = json['Quality_id'];
    materialcolor = json['materialcolor'];
    materialcolorId = json['materialcolor_id'];
    matsize = json['matsize'];
    matsizeId = json['matsize_id'];
    sett = json['sett'];
    settNm = json['Sett_nm'];
    pcs = json['pcs'];
    ctw = json['ctw'];
    pointer = json['pointer'];
    rate = json['rate'];
    dgno = json['dgno'];
    geniid = json['geniid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['id'] = this.id;
    data['Material_id'] = this.materialId;
    data['Material_type'] = this.materialType;
    data['shape'] = this.shape;
    data['shape_id'] = this.shapeId;
    data['Quality'] = this.quality;
    data['Quality_id'] = this.qualityId;
    data['materialcolor'] = this.materialcolor;
    data['materialcolor_id'] = this.materialcolorId;
    data['matsize'] = this.matsize;
    data['matsize_id'] = this.matsizeId;
    data['sett'] = this.sett;
    data['Sett_nm'] = this.settNm;
    data['pcs'] = this.pcs;
    data['ctw'] = this.ctw;
    data['pointer'] = this.pointer;
    data['rate'] = this.rate;
    data['dgno'] = this.dgno;
    data['geniid'] = this.geniid;
    return data;
  }
}