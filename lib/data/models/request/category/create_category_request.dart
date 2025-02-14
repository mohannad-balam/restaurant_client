class CreateCategoryRequest {
  String? name;
  String? description;
  String? image;

  CreateCategoryRequest({this.name, this.description, this.image});

  CreateCategoryRequest.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['description'] = this.description;
    data['image'] = this.image;
    return data;
  }
}
