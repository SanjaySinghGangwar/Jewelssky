class SizeARequest {
  String? matType;
  String? shape;

  SizeARequest({this.matType, this.shape});

  SizeARequest.fromJson(Map<String, dynamic> json) {
    matType = json['mat_type'];
    shape = json['shape'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mat_type'] = this.matType;
    data['shape'] = this.shape;
    return data;
  }
}