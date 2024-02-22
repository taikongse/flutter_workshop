class ModelStaff {
  String? token;
  String? username;
  String? firstName;
  String? lastName;
  String? birthDate;
  String? idCard;
  String? email;
  String? password;

  ModelStaff({
    this.token,
    this.username,
    this.firstName,
    this.lastName,
    this.birthDate,
    this.idCard,
    this.email,
    this.password,
  });

  Map<String, dynamic> signinBodyToJson() {
    return {
      "username": username,
      "password": password,
    };
  }

  Map<String, dynamic> signupToJson() {
    return {
      "username": username,
      "password": password,
      "first_name": firstName,
      "last_name": lastName,
      "birth_date": birthDate,
      "id_card": idCard,
      "email": email,
    };
  }

  Map<String, dynamic> toJson() {
    return {
      "token": token,
      "username": username,
      "first_name": firstName,
      "last_name": lastName,
      "birth_date": birthDate,
      "id_card": idCard,
      "email": email,
      "password": password,
    };
  }

  factory ModelStaff.fromJson(dynamic json) {
    return ModelStaff(
      token: json["token"] ?? '',
      username: json["username"] ?? '',
      firstName: json["first_name"] ?? '',
      lastName: json["last_name"] ?? '',
      birthDate: json["birth_date"] ?? '',
      idCard: json["id_card"] ?? '',
      email: json["email"] ?? '',
      // password: json["password"],
    );
  }
}
