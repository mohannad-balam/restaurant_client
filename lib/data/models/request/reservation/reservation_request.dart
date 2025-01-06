class ReservationRequest {
  String? firstName;
  String? lastName;
  String? email;
  String? telNumber;
  int? guestNumber;
  String? resDate;
  int? tableId;

  ReservationRequest(
      {this.firstName,
      this.lastName,
      this.email,
      this.telNumber,
      this.guestNumber,
      this.resDate,
      this.tableId});

  ReservationRequest.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    telNumber = json['tel_number'];
    guestNumber = json['guest_number'];
    resDate = json['res_date'];
    tableId = json['table_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['tel_number'] = this.telNumber;
    data['guest_number'] = this.guestNumber;
    data['res_date'] = this.resDate;
    data['table_id'] = this.tableId;
    return data;
  }
}