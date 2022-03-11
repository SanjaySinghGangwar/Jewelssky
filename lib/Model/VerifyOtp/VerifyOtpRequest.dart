class VerifyOtpRequest {
    String otp;
    String user_id;

    VerifyOtpRequest({required this.otp, required this.user_id});

    factory VerifyOtpRequest.fromJson(Map<String, dynamic> json) {
        return VerifyOtpRequest(
            otp: json['otp'], 
            user_id: json['user_id'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['otp'] = this.otp;
        data['user_id'] = this.user_id;
        return data;
    }
}