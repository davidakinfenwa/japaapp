// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:japaapp/business/blocs/bloc_state.dart';
import 'package:japaapp/business/snapshot_cache/snapshot_cache.dart';
import 'package:japaapp/core/exceptions/exceptions.dart';
import 'package:japaapp/domain/form_params/form_params.dart';
import 'package:japaapp/domain/model/models.dart';
import 'package:japaapp/domain/repositories/account_repository.dart';
import 'package:japaapp/domain/repositories/repositories.dart';


class CreateBasicInformationCubit extends Cubit<BlocState<Failure<ExceptionMessage>, CompoundUserInfoModel>> {
  final AccountRepository _repository;
  final AccountSnapshotCache _snapshotCache;

  CreateBasicInformationCubit({
    required AccountRepository repository,
    required AccountSnapshotCache snapshotCache,
  })  : _repository = repository,
        _snapshotCache = snapshotCache,
        super(const BlocState<Failure<ExceptionMessage>,
            CompoundUserInfoModel>.initial());

  Future<void> createBasicInfo({required BasicInformationFormParams basicInformationFormParams, required File? image}) async {
    emit(const BlocState<Failure<ExceptionMessage>, CompoundUserInfoModel>.loading());

    final _signupEither = await _repository.createBasicInformation(basicInformationFormParams: basicInformationFormParams, image: image);

        

    final _state = _signupEither.fold(
      (failure) => BlocState<Failure<ExceptionMessage>, CompoundUserInfoModel>.error(
          failure: failure),
      (userInfoModel) {
        // cache snapshot
       
          _snapshotCache.basicUserInfo = userInfoModel;
        

        return BlocState<Failure<ExceptionMessage>, CompoundUserInfoModel>.success(data: userInfoModel);
      },
    );

    emit(_state);
  }
}
