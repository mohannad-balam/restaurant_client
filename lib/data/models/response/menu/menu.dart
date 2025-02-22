class MenuModel {
  int? id;
  String? name;
  String? description;
  String? image;
  String? price;
  String? createdAt;
  String? updatedAt;

  MenuModel(
      {this.id,
      this.name,
      this.description,
      this.image,
      this.price,
      this.createdAt,
      this.updatedAt});

  MenuModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    image = json['image'];
    price = json['price'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['image'] = this.image;
    data['price'] = this.price;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}