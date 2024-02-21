import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:japaapp/business/blocs/bloc_state.dart';
import 'package:japaapp/core/exceptions/exceptions.dart';
import 'package:japaapp/domain/form_params/form_params.dart';
import 'package:japaapp/domain/model/models.dart';
import 'package:japaapp/domain/repositories/repositories.dart';


class SignupOtpVerificationFormCubit extends Cubit<
    BlocState<Failure<ExceptionMessage>, ResponseModel<GenericResponseModel>>> {
  final AuthRepository _repository;

  SignupOtpVerificationFormCubit({required AuthRepository repository})
      : _repository = repository,
        super(const BlocState<Failure<ExceptionMessage>,
            ResponseModel<GenericResponseModel>>.initial());

  Future<void> verifyOTPCode({
    required SignupOtpVerificationFormParams signupOtpVerificationFormParams,
  }) async {
    emit(const BlocState<Failure<ExceptionMessage>,
        ResponseModel<GenericResponseModel>>.loading());

    final _verifyOtpEither = await _repository.verifySignupOTPCode(
      signupOtpVerificationFormParams: signupOtpVerificationFormParams,
    );

    print("THIS IS OTP EITHER $_verifyOtpEither");
 
    final _state = _verifyOtpEither.fold(
      (failure) => BlocState<Failure<ExceptionMessage>,
          ResponseModel<GenericResponseModel>>.error(failure: failure),
      (responseModel) {
        return BlocState<Failure<ExceptionMessage>,
            ResponseModel<GenericResponseModel>>.success(data: responseModel);
      },
    );

    emit(_state);
  }
}
