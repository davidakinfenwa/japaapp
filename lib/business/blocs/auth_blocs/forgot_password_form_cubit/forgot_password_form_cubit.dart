

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:japaapp/business/blocs/bloc_state.dart';
import 'package:japaapp/business/snapshot_cache/snapshot_cache.dart';
import 'package:japaapp/core/exceptions/exceptions.dart';
import 'package:japaapp/domain/form_params/form_params.dart';
import 'package:japaapp/domain/model/models.dart';
import 'package:japaapp/domain/repositories/repositories.dart';


class ForgotPasswordFormCubit extends Cubit<
    BlocState<Failure<ExceptionMessage>, ResponseModel<AuthKeyModel>>> {
  final AuthRepository _repository;
  final AuthSnapshotCache _snapshotCache;

  ForgotPasswordFormCubit({
    required AuthRepository repository,
    required AuthSnapshotCache snapshotCache,
  })  : _repository = repository,
        _snapshotCache = snapshotCache,
        super(const BlocState<Failure<ExceptionMessage>,
            ResponseModel<AuthKeyModel>>.initial());

  Future<void> forgotPassword(
      {required ForgotPasswordFormParams forgotPasswordFormParams}) async {
    emit(const BlocState<Failure<ExceptionMessage>,
        ResponseModel<AuthKeyModel>>.loading());

    final _forgotPasswordEither = await _repository.forgotPassword(
        forgotPasswordFormParams: forgotPasswordFormParams);

    final _state = _forgotPasswordEither.fold(
      (failure) => BlocState<Failure<ExceptionMessage>,
          ResponseModel<AuthKeyModel>>.error(failure: failure),
      (responseModel) {
        // cache snapshot
        _snapshotCache.authKeyModel = responseModel.maybeMap(
          orElse: () => AuthKeyModel.empty(),
          successResponse: (state) => state.data,
        );

        return BlocState<Failure<ExceptionMessage>,
            ResponseModel<AuthKeyModel>>.success(data: responseModel);
      },
    );

    emit(_state);
  }
}
