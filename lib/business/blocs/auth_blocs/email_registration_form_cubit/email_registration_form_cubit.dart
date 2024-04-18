// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:japaapp/business/blocs/bloc_state.dart';
import 'package:japaapp/business/snapshot_cache/snapshot_cache.dart';
import 'package:japaapp/core/exceptions/exceptions.dart';
import 'package:japaapp/domain/form_params/auth/email_validation_form_params.dart';
import 'package:japaapp/domain/model/models.dart';
import 'package:japaapp/domain/repositories/repositories.dart';


class EmailRegistaionCubit
    extends Cubit<BlocState<Failure<ExceptionMessage>, UserInfoModel>> {
  final AuthRepository _repository;
  final AuthSnapshotCache _snapshotCache;

  EmailRegistaionCubit({
    required AuthRepository repository,
    required AuthSnapshotCache snapshotCache,
  })  : _repository = repository,
        _snapshotCache = snapshotCache,
        super(const BlocState<Failure<ExceptionMessage>,
            UserInfoModel>.initial());

  Future<void> emailRegistraiton({required EmailValidationFromParams emailValidationFromParams}) async {
    emit(const BlocState<Failure<ExceptionMessage>, UserInfoModel>.loading());

    final _signupEither = await _repository.emailRegistration(emailValidationFromParams: emailValidationFromParams);

        

    final _state = _signupEither.fold(
      (failure) => BlocState<Failure<ExceptionMessage>, UserInfoModel>.error(
          failure: failure),
      (userInfoModel) {
        // cache snapshot
       
          _snapshotCache.userInfo = userInfoModel.data;
        

        return BlocState<Failure<ExceptionMessage>, UserInfoModel>.success(
            data: userInfoModel);
      },
    );

    emit(_state);
  }
}
