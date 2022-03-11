class SubCategoryRequest {
    String cat;
    String col;

    SubCategoryRequest({required this.cat, required this.col});

    factory SubCategoryRequest.fromJson(Map<String, dynamic> json) {
        return SubCategoryRequest(
            cat: json['cat'], 
            col: json['col'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['cat'] = this.cat;
        data['col'] = this.col;
        return data;
    }
}