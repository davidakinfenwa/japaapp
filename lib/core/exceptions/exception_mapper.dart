import 'package:dio/dio.dart';
import 'package:japaapp/core/exceptions/exceptions.dart';


class ExceptionMapper {
  ExceptionType<ExceptionMessage> mapException(DioException e) {
    if (e.type == DioExceptionType.connectionTimeout) {
      return const ExceptionType<ExceptionMessage>.serverException(
        code: ExceptionCode.REQUEST_TIMEOUT,
        message: ExceptionMessage.REQUEST_TIMEOUT,
      );
    }

    if (e.response?.statusCode == 404) {
      return const ExceptionType<ExceptionMessage>.serverException(
        code: ExceptionCode.NOT_FOUND,
        message: ExceptionMessage.NOT_FOUND,
      );
    }

    if (e.response?.statusCode == 500) {
      return const ExceptionType<ExceptionMessage>.serverException(
        code: ExceptionCode.UNDEFINED,
        message: ExceptionMessage.UNDEFINED,
      );
    }

    
    if (e.response?.statusCode == 403) {
      return const ExceptionType<ExceptionMessage>.serverException(
        code: ExceptionCode.EXISTING,
        message: ExceptionMessage.EXISTING,
      );
    }

    return ExceptionType<ExceptionMessage>.serverException(
      code: ExceptionCode.UNDEFINED,
      message: ExceptionMessage.parse(e.message.toString()),
    );
  }
}
