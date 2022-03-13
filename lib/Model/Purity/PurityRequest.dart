class PurityRequest {
  String? mIdPurity;

  PurityRequest({this.mIdPurity});

  PurityRequest.fromJson(Map<String, dynamic> json) {
    mIdPurity = json['m_id_purity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['m_id_purity'] = this.mIdPurity;
    return data;
  }
}