
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:japaapp/business/blocs/bloc_state.dart';

import 'package:japaapp/core/exceptions/exceptions.dart';
import 'package:japaapp/domain/form_params/form_params.dart';
import 'package:japaapp/domain/model/models.dart';
import 'package:japaapp/domain/repositories/repositories.dart';


class ForgotPasswordOtpVerificationFormCubit
    extends Cubit<BlocState<Failure<ExceptionMessage>, GenericResponseModel>> {
  final AuthRepository _repository;

  ForgotPasswordOtpVerificationFormCubit({required AuthRepository repository})
      : _repository = repository,
        super(const BlocState<Failure<ExceptionMessage>,
            GenericResponseModel>.initial());

  Future<void> verifyForgotPasswordOTPCode({
    required ForgotPasswordOtpVerificationFormParams
        forgotPasswordOtpVerificationFormParams,
  }) async {
    emit(const BlocState<Failure<ExceptionMessage>,
        GenericResponseModel>.loading());

    final _otpVerificationEither = await _repository.verifyPasswordResetOTPCode(
        forgotPasswordOtpVerificationFormParams:
            forgotPasswordOtpVerificationFormParams);

    final _state = _otpVerificationEither.fold(
      (failure) =>
          BlocState<Failure<ExceptionMessage>, GenericResponseModel>.error(
              failure: failure),
      (_) => BlocState<Failure<ExceptionMessage>, GenericResponseModel>.success(
          data: _),
    );

    emit(_state);
  }
}
