class PersonModel {
  int? id;
  String? firstName;
  String? lastName;
  String? otherName;
  String? phone;
  String? email;
  String? address;
  DateTime? dateJoined;
  bool? active;
  DateTime? createdAt;

  PersonModel({
    this.id,
    this.firstName,
    this.lastName,
    this.otherName,
    this.phone,
    this.email,
    this.address,
    this.dateJoined,
    this.active,
    this.createdAt,
  });

  factory PersonModel.fromJson(Map<String, dynamic> json) {
    return PersonModel(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      otherName: json['otherName'],
      phone: json['phone'],
      email: json['email'],
      address: json['address'],
      dateJoined: DateTime.fromMicrosecondsSinceEpoch(json['dateJoined'] * 1000),
      active: json['active'],
      createdAt: DateTime.fromMicrosecondsSinceEpoch(json['createdAt'] * 1000),
    );
  }

  static reset() {
    return PersonModel(
      id: null,
      firstName: null,
      lastName: null,
      otherName: null,
      phone: null,
      email: null,
      address: null,
      dateJoined: null,
      active: null,
      createdAt: null,
    );
  }

  Map<String, dynamic> toViewJson() {
    return {
      'id': id,
      'name': "$firstName $lastName${(otherName != null) ? ' $otherName' : ""}",
      'firstName': firstName,
      'lastName': lastName,
      'otherName': otherName,
      'phone': phone,
      'email': email,
      'address': address,
      'dateJoined': dateJoined,
      'active': active,
      'createdAt': createdAt,
    };
  }

  Map<String, dynamic> toApiJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'otherName': otherName,
      'phone': phone,
      'email': email,
      'address': address,
      'dateJoined': dateJoined,
      'active': active,
      'createdAt': createdAt,
    };
  }
}
