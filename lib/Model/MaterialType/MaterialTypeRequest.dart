class MaterialTypeRequest {
  String? prodeId;

  MaterialTypeRequest({this.prodeId});

  MaterialTypeRequest.fromJson(Map<String, dynamic> json) {
    prodeId = json['prode_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['prode_id'] = this.prodeId;
    return data;
  }
}