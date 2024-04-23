import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:japaapp/business/blocs/bloc_state.dart';
import 'package:japaapp/business/snapshot_cache/snapshot_cache.dart';
import 'package:japaapp/core/exceptions/exceptions.dart';

import 'package:japaapp/domain/model/models.dart';
import 'package:japaapp/domain/repositories/account_repository.dart';

import '../../snapshot_cache/account_snapshot_cache.dart';



class GetAllUserDataFormCubit extends  Cubit<BlocState<Failure<ExceptionMessage>, CompoundUserInfoModel>>{
  final AccountRepository _repository;
  final AccountSnapshotCache _snapshotCache;

  GetAllUserDataFormCubit({required AccountRepository repository , required AccountSnapshotCache snapshotCache,
  })  : _repository = repository,
        _snapshotCache = snapshotCache,
        super(const BlocState<Failure<ExceptionMessage>,CompoundUserInfoModel>.initial());

  Future<void> userAuthenticatedData() async {
    emit(const BlocState<Failure<ExceptionMessage>, CompoundUserInfoModel>.loading());

    final userAuthenticated = await _repository.getAuthenticatedUserProfile();

 
    final state = userAuthenticated.fold((failure) =>  BlocState<Failure<ExceptionMessage>, CompoundUserInfoModel>.error(failure: failure),

      (success) { 
        
          _snapshotCache.userInfor=success;
          
        return  BlocState<Failure<ExceptionMessage>, CompoundUserInfoModel>.success(data: success);
      },
    );

    emit(state);
  }
}
