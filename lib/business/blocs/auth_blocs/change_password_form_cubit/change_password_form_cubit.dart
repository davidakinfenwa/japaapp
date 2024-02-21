

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:japaapp/business/blocs/bloc_state.dart';

import 'package:japaapp/core/exceptions/exceptions.dart';
import 'package:japaapp/domain/form_params/form_params.dart';
import 'package:japaapp/domain/model/models.dart';
import 'package:japaapp/domain/repositories/repositories.dart';


class ChangePasswordFormCubit
    extends Cubit<BlocState<Failure<ExceptionMessage>, GenericResponseModel>> {
  final AuthRepository _repository;

  ChangePasswordFormCubit({required AuthRepository repository})
      : _repository = repository,
        super(const BlocState<Failure<ExceptionMessage>,
            GenericResponseModel>.initial());

  Future<void> changePassword({
    required ChangePasswordFormParams changePasswordFormParams,
  }) async {
    emit(const BlocState<Failure<ExceptionMessage>,
        GenericResponseModel>.loading());

    final _changePasswordEither = await _repository.changePassword(
        changePasswordFormParams: changePasswordFormParams);

    final _state = _changePasswordEither.fold(
      (failure) =>
          BlocState<Failure<ExceptionMessage>, GenericResponseModel>.error(
              failure: failure),
      (_) => BlocState<Failure<ExceptionMessage>, GenericResponseModel>.success(
          data: _),
    );

    emit(_state);
  }
}
