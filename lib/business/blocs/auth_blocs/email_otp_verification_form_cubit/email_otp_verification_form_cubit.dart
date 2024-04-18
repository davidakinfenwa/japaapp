import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:japaapp/business/blocs/bloc_state.dart';
import 'package:japaapp/business/snapshot_cache/snapshot_cache.dart';
import 'package:japaapp/core/exceptions/exceptions.dart';
import 'package:japaapp/domain/form_params/form_params.dart';
import 'package:japaapp/domain/model/auth/email_verification_otp_model.dart';
import 'package:japaapp/domain/repositories/repositories.dart';


class EmailOtpVerificationFormCubit extends  Cubit<BlocState<Failure<ExceptionMessage>, EmailVerificationOtpModel>>{
  final AuthRepository _repository;
  final AuthSnapshotCache _snapshotCache;

  EmailOtpVerificationFormCubit({required AuthRepository repository , required AuthSnapshotCache snapshotCache,
  })  : _repository = repository,
        _snapshotCache = snapshotCache,
        super(const BlocState<Failure<ExceptionMessage>,EmailVerificationOtpModel>.initial());

  Future<void> verifyOTPCode({required EmailOtpVerificationFormParams emailOtpVerificationFormParams}) async {
    emit(const BlocState<Failure<ExceptionMessage>, EmailVerificationOtpModel>.loading());

    final verifyOtpEither = await _repository.verifyEmailOTPCode(emailOtpVerificationFormParams: emailOtpVerificationFormParams);

 
    final state = verifyOtpEither.fold((failure) =>  BlocState<Failure<ExceptionMessage>, EmailVerificationOtpModel>.error(failure: failure),

      (success) { 
          _snapshotCache.emailVerificationOtpModel=success;
        return  BlocState<Failure<ExceptionMessage>, EmailVerificationOtpModel>.success(data: success);
      },
    );

    emit(state);
  }
}
