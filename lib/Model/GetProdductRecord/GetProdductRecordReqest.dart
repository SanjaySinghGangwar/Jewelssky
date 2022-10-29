class GetProdductRecordReqest {
  String? jobId;

  GetProdductRecordReqest({this.jobId});

  GetProdductRecordReqest.fromJson(Map<String, dynamic> json) {
    jobId = json['job_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['job_id'] = this.jobId;
    return data;
  }
}