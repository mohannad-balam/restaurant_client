class ReservationEntity {
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

  ReservationEntity(
      {this.id,
      this.firstName,
      this.lastName,
      this.email,
      this.telNumber,
      this.resDate,
      this.tableId,
      this.guestNumber,
      this.createdAt,
      this.updatedAt});
}
