import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:japaapp/business/blocs/bloc_state.dart';
import 'package:japaapp/business/snapshot_cache/snapshot_cache.dart';
import 'package:japaapp/core/exceptions/exceptions.dart';

import 'package:japaapp/domain/model/models.dart';
import 'package:japaapp/domain/repositories/repositories.dart';


class GetAuthenticatedUserCubit
    extends Cubit<BlocState<Failure<ExceptionMessage>, UserInfoModel>> {
  final AuthRepository _repository;
  final AuthSnapshotCache _snapshotCache;

  GetAuthenticatedUserCubit({
    required AuthRepository repository,
    required AuthSnapshotCache snapshotCache,
  })  : _repository = repository,
        _snapshotCache = snapshotCache,
        super(const BlocState<Failure<ExceptionMessage>,
            UserInfoModel>.initial());

  Future<void> getAuthenticatedUser() async {
    emit(const BlocState<Failure<ExceptionMessage>, UserInfoModel>.loading());

    final _authenticatedUserEither = await _repository.getAuthenticatedUser();

    final _state = _authenticatedUserEither.fold(
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
