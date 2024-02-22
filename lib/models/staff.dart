// ignore_for_file: non_constant_identifier_names

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

  Map<String, dynamic> signinBodyToJason() => {
    "username": username,
    "password": password,
  };

  Map<String, dynamic> signupToJason() => {
    "username": username,
    "password": password,
    "first_name": firstName,
    "last_name": lastName,
    "birth_date": birthDate,
    "id_card": idCard,
    "email": email,
  };

  Map<String, dynamic> toJason() => {
    "token": token,
    "username": username,
    "first_name": firstName,
    "last_name": lastName,
    "birth_date": birthDate,
    "id_card": idCard,
    "email": email,
    "password": password,
  };

  factory ModelStaff.fromJson(dynamic json) => ModelStaff(
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
