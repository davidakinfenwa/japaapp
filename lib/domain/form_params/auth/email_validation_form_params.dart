import 'package:equatable/equatable.dart';

class EmailValidationFromParams extends Equatable {
  final String email;
  final String confirmEmail;


  const EmailValidationFromParams({
    required this.email,
    required this.confirmEmail,
   
  });

  Map<String, dynamic> toJson() {
    return {
      'confirm_email': confirmEmail,
      'email': email,
    };
  }

  @override
  List<Object> get props => [confirmEmail, email];

  @override
  String toString() =>
      'EmailValidationFromParams(firstname: $confirmEmail,email: $email)';
}
