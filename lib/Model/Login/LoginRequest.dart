class LoginRequest {
    String mob;
    String user_id;
    String user_pwd;

    LoginRequest({ required this.user_id,required this.mob, required this.user_pwd});

    factory LoginRequest.fromJson(Map<String, dynamic> json) {
        return LoginRequest(
            mob: json['mob'], 
            user_id: json['user_id'], 
            user_pwd: json['user_pwd'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['mob'] = this.mob;
        data['user_id'] = this.user_id;
        data['user_pwd'] = this.user_pwd;
        return data;
    }
}