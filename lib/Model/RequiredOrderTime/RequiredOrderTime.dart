class RequiredOrderTimeModel {
  String? name;
  String? value;

  RequiredOrderTimeModel({this.name, this.value});

  RequiredOrderTimeModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['value'] = this.value;
    return data;
  }
}