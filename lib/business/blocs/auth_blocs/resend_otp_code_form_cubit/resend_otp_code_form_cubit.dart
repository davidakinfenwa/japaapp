
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:japaapp/business/blocs/bloc_state.dart';
import 'package:japaapp/core/exceptions/exceptions.dart';
import 'package:japaapp/domain/form_params/form_params.dart';
import 'package:japaapp/domain/model/auth/resend_otp_response_model.dart';
import 'package:japaapp/domain/repositories/repositories.dart';


class ResendOtpCodeFormCubit
    extends Cubit<BlocState<Failure<ExceptionMessage>, ResendOtpModel>> {
  final AuthRepository _repository;

  ResendOtpCodeFormCubit({required AuthRepository repository})
      : _repository = repository,
        super(const BlocState<Failure<ExceptionMessage>,
            ResendOtpModel>.initial());

  Future<void> resendOTPVerificationCode(
      {required ResendOtpFormParams resendOtpFormParams}) async {
    emit(const BlocState<Failure<ExceptionMessage>,
        ResendOtpModel>.loading());

    final _resendOTPVerificationCodeEither = await _repository
        .resendOTPVerificationCode(resendOtpFormParams: resendOtpFormParams);

    final _state = _resendOTPVerificationCodeEither.fold(
      (failure) =>
          BlocState<Failure<ExceptionMessage>, ResendOtpModel>.error(
              failure: failure),
      (responseModel) {
        return BlocState<Failure<ExceptionMessage>,
            ResendOtpModel>.success(data: responseModel);
      },
    );

    emit(_state);
  }
}
