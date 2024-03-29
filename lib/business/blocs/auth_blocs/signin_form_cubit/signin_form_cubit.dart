
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:japaapp/business/blocs/bloc_state.dart';
import 'package:japaapp/business/snapshot_cache/snapshot_cache.dart';
import 'package:japaapp/core/exceptions/exceptions.dart';
import 'package:japaapp/domain/form_params/form_params.dart';
import 'package:japaapp/domain/model/models.dart';
import 'package:japaapp/domain/repositories/repositories.dart';


class SigninFormCubit extends Cubit<BlocState<Failure<ExceptionMessage>, UserInfoModel>> {
  final AuthRepository _repository;
  final AuthSnapshotCache _snapshotCache;

  SigninFormCubit({
    required AuthRepository repository,
    required AuthSnapshotCache snapshotCache,
  })  : _repository = repository,
        _snapshotCache = snapshotCache,
        super(const BlocState<Failure<ExceptionMessage>,
            UserInfoModel>.initial());

  Future<void> signin({required SignInFromParams signInFromParams}) async {
    emit(const BlocState<Failure<ExceptionMessage>, UserInfoModel>.loading());

    final _signinEither =
        await _repository.signin(signInFromParams: signInFromParams);

    final _state = _signinEither.fold(
      (failure) => BlocState<Failure<ExceptionMessage>, UserInfoModel>.error(
          failure: failure),
      (userInfoModel) {
        // cache snapshot
        if (userInfoModel.hasUserInfo) {
          _snapshotCache.userInfo = userInfoModel.user;
        }

        return BlocState<Failure<ExceptionMessage>, UserInfoModel>.success(
            data: userInfoModel);
      },
    );

    emit(_state);
  }
}
