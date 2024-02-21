import 'package:equatable/equatable.dart';

class SignUpFromParams extends Equatable {
  final String firstname;
  final String lastname;
  final String email;
  final String password;

  const SignUpFromParams({
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'first_name': firstname,
      'last_name': lastname,
      'password': password,
      'email': email,
    };
  }

  @override
  List<Object> get props => [firstname, lastname,email,  password];

  @override
  String toString() =>
      'SignUpFromParams(firstname: $firstname, lastname: $lastname, password: $password,email: $email)';
}
