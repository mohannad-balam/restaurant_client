class CreateTableRequest {
  String? id;
  String? name;
  int? guestNumber;
  String? status;
  String? location;

  CreateTableRequest(
      {this.name, this.guestNumber, this.status, this.location, this.id});

  CreateTableRequest.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    guestNumber = json['guest_number'];
    status = json['status'];
    location = json['location'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['guest_number'] = this.guestNumber;
    data['status'] = this.status;
    data['location'] = this.location;
    return data;
  }
}
