class CreateMenuRequest {
  String? id;
  String? name;
  String? description;
  double? price;
  String? image;
  List<int>? categories;

  CreateMenuRequest({
    this.name,
    this.description,
    this.price,
    this.image,
    this.id,
    this.categories,
  });

  CreateMenuRequest.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    price = json['price'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['description'] = this.description;
    data['price'] = this.price;
    data['image'] = this.image;
    data['categories'] = this.categories;
    return data;
  }
}
