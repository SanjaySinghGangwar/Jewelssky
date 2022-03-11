class MWCollectionRequest {
    String user_id;

    MWCollectionRequest({required this.user_id});

    factory MWCollectionRequest.fromJson(Map<String, dynamic> json) {
        return MWCollectionRequest(
            user_id: json['user_id'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['user_id'] = this.user_id;
        return data;
    }
}