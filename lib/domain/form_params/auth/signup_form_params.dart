import 'package:equatable/equatable.dart';

class SignUpFromParams extends Equatable {
    final String id;
    final String firstName;
    final String otherName;
    final String lastName;
    final String phoneNumber;
    final String password;
    final String confirmPassword;

  const SignUpFromParams({
    required this.id,
        required this.firstName,
        required this.otherName,
        required this.lastName,
        required this.phoneNumber,
        required this.password,
        required this.confirmPassword,
  });

  Map<String, dynamic> toJson() {
    return {
      "id": id,
        "first_name": firstName,
        "other_name": otherName,
        "last_name": lastName,
        "phone_number": phoneNumber,
        "password": password,
        "confirm_password": confirmPassword,
    };
  }

  @override
  List<Object> get props => [firstName, lastName,  password, confirmPassword, phoneNumber,id,otherName];

  @override
  String toString() =>
      'SignUpFromParams(firstname: $firstName, lastname: $lastName, password: $password,comfirmPassword: $confirmPassword,phoneNumber:$phoneNumber,id:$id,otherName: $otherName)';
}






