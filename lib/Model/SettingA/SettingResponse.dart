class SettingResponse {
  int? messageId;
  String? message;
  List<Data>? data;

  SettingResponse({this.messageId, this.message, this.data});

  SettingResponse.fromJson(Map<String, dynamic> json) {
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
  int? settId;
  String? settingName;
  double? settingAmount;

  Data({this.settId, this.settingName, this.settingAmount});

  Data.fromJson(Map<String, dynamic> json) {
    settId = json['Sett_id'];
    settingName = json['Setting_Name'];
    settingAmount = json['Setting_Amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Sett_id'] = this.settId;
    data['Setting_Name'] = this.settingName;
    data['Setting_Amount'] = this.settingAmount;
    return data;
  }
}