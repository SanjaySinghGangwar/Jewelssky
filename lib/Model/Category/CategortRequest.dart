class CategortRequest {
    String col;

    CategortRequest({required this.col});

    factory CategortRequest.fromJson(Map<String, dynamic> json) {
        return CategortRequest(
            col: json['col'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['col'] = this.col;
        return data;
    }
}