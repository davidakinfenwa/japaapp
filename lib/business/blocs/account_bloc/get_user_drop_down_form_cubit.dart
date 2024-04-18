import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:japaapp/business/blocs/bloc_state.dart';
import 'package:japaapp/business/snapshot_cache/snapshot_cache.dart';
import 'package:japaapp/core/exceptions/exceptions.dart';

import 'package:japaapp/domain/model/models.dart';
import 'package:japaapp/domain/repositories/account_repository.dart';

import '../../snapshot_cache/account_snapshot_cache.dart';



class GetUserDropdownFormCubit extends  Cubit<BlocState<Failure<ExceptionMessage>, ProfileDropDownModel>>{
  final AccountRepository _repository;
  final AccountSnapshotCache _snapshotCache;

  GetUserDropdownFormCubit({required AccountRepository repository , required AccountSnapshotCache snapshotCache,
  })  : _repository = repository,
        _snapshotCache = snapshotCache,
        super(const BlocState<Failure<ExceptionMessage>,ProfileDropDownModel>.initial());

  Future<void> userDropdownData() async {
    emit(const BlocState<Failure<ExceptionMessage>, ProfileDropDownModel>.loading());

    final userAuthenticated = await _repository.getProfileDropdownData();

 
    final state = userAuthenticated.fold((failure) =>  BlocState<Failure<ExceptionMessage>, ProfileDropDownModel>.error(failure: failure),

      (success) { 
          _snapshotCache.userDropdownInfo=success;
        return  BlocState<Failure<ExceptionMessage>, ProfileDropDownModel>.success(data: success);
      },
    );

    emit(state);
  }
}
