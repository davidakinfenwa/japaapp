import 'package:equatable/equatable.dart';

class SignInFromParams extends Equatable {
  final String email;
  final String password;

  const SignInFromParams({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }

  @override
  List<Object> get props => [email, password];

  @override
  String toString() =>
      'SignInFromParams(phoneNumber: $email, password: $password)';
}
