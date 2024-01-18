// ignore_for_file: non_constant_identifier_names

class ModelStaff {
  String? Token;
  String? Username;
  String? FirstName;
  String? LastName;
  String? BirthDate;
  String? IdCard;
  String? Email;
  String? Password;

  ModelStaff({
    this.Token,
    this.Username,
    this.FirstName,
    this.LastName,
    this.BirthDate,
    this.IdCard,
    this.Email,
    this.Password,
  });

  Map<String, dynamic> requestBodyToJson() {
    return {
      'username': Username,
      'password': Password,
    };
  }

  Map<String, dynamic> responseBodyToJson() {
    return {
      'token': Token,
      'username': Username,
      'first_name': FirstName,
      'last_name': LastName,
      'birth_date': BirthDate,
      'id_card': IdCard,
      'email': Email,
    };
  }
}
