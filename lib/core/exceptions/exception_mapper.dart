import 'package:dio/dio.dart';
import 'package:japaapp/core/constants.dart';
import 'package:japaapp/core/exceptions/exceptions.dart';



class ExceptionMapper {
  ExceptionType<ExceptionMessage> mapException(DioException e) {
    if (e.type == DioExceptionType.connectionTimeout) {
      return const ExceptionType<ExceptionMessage>.serverException(
        code: ExceptionCode.REQUEST_TIMEOUT,
        message: ExceptionMessage.REQUEST_TIMEOUT,
      );
    }

    if (e.type == DioExceptionType.receiveTimeout) {
      return const ExceptionType<ExceptionMessage>.serverException(
        code: ExceptionCode.REQUEST_TIMEOUT,
        message: ExceptionMessage.REQUEST_TIMEOUT,
      );
    }

    if (e.response?.statusCode == 404) {
      return  ExceptionType<ExceptionMessage>.serverException(
        code: ExceptionCode.NOT_FOUND,
        message: ExceptionMessage.parse(formatError(e.response!.data['error'])),
      );
    }

    if (e.response?.statusCode == 500) {
      return  ExceptionType<ExceptionMessage>.serverException(
        code: ExceptionCode.UNDEFINED,
        message: ExceptionMessage.parse(formatError(e.response!.data['error'])),
      );
    }
    if (e.response?.statusCode == 403) {
      return  ExceptionType<ExceptionMessage>.serverException(
        code: ExceptionCode.UNDEFINED,
        message: ExceptionMessage.parse(formatError(e.response!.data['error'])),
      );
    }

    return ExceptionType<ExceptionMessage>.serverException(
      code: ExceptionCode.UNDEFINED,
      message: ExceptionMessage.parse(e.error.toString()),
    );
  }
}
