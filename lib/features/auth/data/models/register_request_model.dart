class RegisterRequestModel {
  final String name;
  final String email;
  final String password;
  final String nik;
  final String address;
  final String number;
  final String gender;
  final String dateOfBirth;

  RegisterRequestModel({
    required this.name,
    required this.email,
    required this.password,
    required this.nik,
    required this.address,
    required this.number,
    required this.gender,
    required this.dateOfBirth,
  });

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "email": email,
      "password": password,
      "nik": nik,
      "address": address,
      "number": number,
      "gender": gender,
      "date_of_birth": dateOfBirth,
    };
  }
}