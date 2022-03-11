class SaveDesignSetFirstResponse {
  int? messageId;
  String? message;
  String? design;
  int? job;
  int? al;

  SaveDesignSetFirstResponse(
      {this.messageId, this.message, this.design, this.job, this.al});

  SaveDesignSetFirstResponse.fromJson(Map<String, dynamic> json) {
    messageId = json['MessageId'];
    message = json['Message'];
    design = json['design'];
    job = json['job'];
    al = json['al'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['MessageId'] = this.messageId;
    data['Message'] = this.message;
    data['design'] = this.design;
    data['job'] = this.job;
    data['al'] = this.al;
    return data;
  }
}