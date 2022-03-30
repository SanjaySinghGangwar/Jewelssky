class jobWiseMaterialDetailsRequest {
  String? jobNo;

  jobWiseMaterialDetailsRequest({this.jobNo});

  jobWiseMaterialDetailsRequest.fromJson(Map<String, dynamic> json) {
    jobNo = json['job_no'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['job_no'] = this.jobNo;
    return data;
  }
}