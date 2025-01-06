class TableModel {
  int? id;
  String? name;
  int? guestNumber;
  String? status;
  String? location;
  String? createdAt;
  String? updatedAt;

  TableModel(
      {this.id,
      this.name,
      this.guestNumber,
      this.status,
      this.location,
      this.createdAt,
      this.updatedAt});

  TableModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    guestNumber = json['guest_number'];
    status = json['status'];
    location = json['location'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['guest_number'] = this.guestNumber;
    data['status'] = this.status;
    data['location'] = this.location;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}