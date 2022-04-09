class SaveMetalSetSecondRequest {
  String? userId;
  String? id;
  String? puritydt;
  String? purity;
  String? matcol;
  String? mntwastage;
  String? gwt;
  String? nwt;
  String? dgno;
  String? geniid;
  String? makamt;
  String? mattypes;
  String? mattypesNm;
  String? orderid;
  String? oldJobNo;
  String? labCerti;
  String? makeType;

  SaveMetalSetSecondRequest(
      {this.userId,
        this.id,
        this.puritydt,
        this.purity,
        this.matcol,
        this.mntwastage,
        this.gwt,
        this.nwt,
        this.dgno,
        this.geniid,
        this.makamt,
        this.mattypes,
        this.mattypesNm,
        this.orderid,
        this.oldJobNo,
        this.labCerti,
        this.makeType});

  SaveMetalSetSecondRequest.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    id = json['id'];
    puritydt = json['puritydt'];
    purity = json['purity'];
    matcol = json['matcol'];
    mntwastage = json['mntwastage'];
    gwt = json['gwt'];
    nwt = json['nwt'];
    dgno = json['dgno'];
    geniid = json['geniid'];
    makamt = json['makamt'];
    mattypes = json['mattypes'];
    mattypesNm = json['mattypes_nm'];
    orderid = json['orderid'];
    oldJobNo = json['old_job_no'];
    labCerti = json['lab_certi'];
    makeType = json['Make_Type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['id'] = this.id;
    data['puritydt'] = this.puritydt;
    data['purity'] = this.purity;
    data['matcol'] = this.matcol;
    data['mntwastage'] = this.mntwastage;
    data['gwt'] = this.gwt;
    data['nwt'] = this.nwt;
    data['dgno'] = this.dgno;
    data['geniid'] = this.geniid;
    data['makamt'] = this.makamt;
    data['mattypes'] = this.mattypes;
    data['mattypes_nm'] = this.mattypesNm;
    data['orderid'] = this.orderid;
    data['old_job_no'] = this.oldJobNo;
    data['lab_certi'] = this.labCerti;
    data['Make_Type'] = this.makeType;
    return data;
  }
}