class QualityRequest {
  String? matType;

  QualityRequest({this.matType});

  QualityRequest.fromJson(Map<String, dynamic> json) {
    matType = json['mat_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mat_type'] = this.matType;
    return data;
  }
}