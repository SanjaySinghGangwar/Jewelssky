class SelectCollectionRequest {
  String ptype;

  SelectCollectionRequest({required this.ptype});

  factory SelectCollectionRequest.fromJson(Map<String, dynamic> json) {
    return SelectCollectionRequest(
      ptype: json['ptype'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ptype'] = ptype;
    return data;
  }
}
