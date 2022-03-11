class SaveDesignSetFirstRequest {
  String? userId;
  String? ptype;
  String? coll;
  String? cat;
  String? scat;
  String? cultId;
  String? cultNm;
  String? occi;
  String? occiNm;
  String? stype;
  String? exday;
  String? orderTime;
  String? huid;

  SaveDesignSetFirstRequest(
      {this.userId,
        this.ptype,
        this.coll,
        this.cat,
        this.scat,
        this.cultId,
        this.cultNm,
        this.occi,
        this.occiNm,
        this.stype,
        this.exday,
        this.orderTime,
        this.huid});

  SaveDesignSetFirstRequest.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    ptype = json['ptype'];
    coll = json['coll'];
    cat = json['cat'];
    scat = json['scat'];
    cultId = json['cult_id'];
    cultNm = json['cult_nm'];
    occi = json['occi'];
    occiNm = json['occi_nm'];
    stype = json['stype'];
    exday = json['exday'];
    orderTime = json['order_time'];
    huid = json['huid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['ptype'] = this.ptype;
    data['coll'] = this.coll;
    data['cat'] = this.cat;
    data['scat'] = this.scat;
    data['cult_id'] = this.cultId;
    data['cult_nm'] = this.cultNm;
    data['occi'] = this.occi;
    data['occi_nm'] = this.occiNm;
    data['stype'] = this.stype;
    data['exday'] = this.exday;
    data['order_time'] = this.orderTime;
    data['huid'] = this.huid;
    return data;
  }
}