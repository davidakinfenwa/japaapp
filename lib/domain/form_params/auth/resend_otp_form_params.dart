import 'package:equatable/equatable.dart';

class ResendOtpFormParams extends Equatable {
  final String id;

  const ResendOtpFormParams({required this.id});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
    };
  }

  @override
  List<Object> get props => [id];

  @override
  String toString() => 'ResendOtpFormParams(phoneNumber: $id)';
}
