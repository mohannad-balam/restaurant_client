class ReservationModel {
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? telNumber;
  String? resDate;
  int? tableId;
  int? guestNumber;
  String? createdAt;
  String? updatedAt;
  String? table;

  ReservationModel(
      {this.id,
      this.firstName,
      this.lastName,
      this.email,
      this.telNumber,
      this.resDate,
      this.tableId,
      this.guestNumber,
      this.createdAt,
      this.updatedAt,
      this.table});

  ReservationModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    telNumber = json['tel_number'];
    resDate = json['res_date'];
    tableId = json['table_id'];
    guestNumber = json['guest_number'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    table = json['table'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['tel_number'] = this.telNumber;
    data['res_date'] = this.resDate;
    data['table_id'] = this.tableId;
    data['guest_number'] = this.guestNumber;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['table'] = this.table;
    return data;
  }
}
