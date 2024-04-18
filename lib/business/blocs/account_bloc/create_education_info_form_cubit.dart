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


class CreateEducationInformationCubit extends Cubit<BlocState<Failure<ExceptionMessage>, CompoundUserInfoModel>> {
  final AccountRepository _repository;
  final AccountSnapshotCache _snapshotCache;

  CreateEducationInformationCubit({
    required AccountRepository repository,
    required AccountSnapshotCache snapshotCache,
  })  : _repository = repository,
        _snapshotCache = snapshotCache,
        super(const BlocState<Failure<ExceptionMessage>,
            CompoundUserInfoModel>.initial());

  Future<void> createEducationInfo({required List<dynamic> educationLevelModel}) async {
    emit(const BlocState<Failure<ExceptionMessage>, CompoundUserInfoModel>.loading());

    final _signupEither = await _repository.createEducationInformation(educationLevelModel: educationLevelModel);

        

    final _state = _signupEither.fold(
      (failure) => BlocState<Failure<ExceptionMessage>, CompoundUserInfoModel>.error(
          failure: failure),
      (userInfoModel) {
        // cache snapshot
       
          _snapshotCache.userInfor = userInfoModel;
        

        return BlocState<Failure<ExceptionMessage>, CompoundUserInfoModel>.success(data: userInfoModel);
      },
    );

    emit(_state);
  }
}
