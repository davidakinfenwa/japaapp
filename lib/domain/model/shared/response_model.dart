import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'response_model.freezed.dart';

@freezed
class ResponseModel<T> with _$ResponseModel<T> {
  const factory ResponseModel.successResponse({required T data}) =
      SuccessResponse;
  const factory ResponseModel.errorResponse(
      {required GenericResponseModel data}) = ErrorResponse;
}

class GenericResponseModel extends Equatable {
  final bool status;
  final String message;
  // final int error;

  const GenericResponseModel({
    required this.status,
    required this.message,
    // required this.error,
  });

  factory GenericResponseModel.fromJson(Map<String, dynamic> json) {
    return GenericResponseModel(
      status: json['status'],
      message: json['message'],
      // responseNumber: json['response_no'],
    );
  }

  @override
  List<Object> get props => [status, message,];

  @override
  String toString() {
    return 'GenericResponseModel(status: $status, message: $message, )';
  }
}
