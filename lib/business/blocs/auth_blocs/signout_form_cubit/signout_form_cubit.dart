import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:japaapp/business/blocs/bloc_state.dart';

import 'package:japaapp/core/exceptions/exceptions.dart';
import 'package:japaapp/core/util/unit_impl.dart';

import 'package:japaapp/domain/repositories/repositories.dart';


class SignoutFormCubit
    extends Cubit<BlocState<Failure<ExceptionMessage>, UnitImpl>> {
  final AuthRepository _repository;

  SignoutFormCubit({required AuthRepository repository})
      : _repository = repository,
        super(const BlocState<Failure<ExceptionMessage>, UnitImpl>.initial());

  Future<void> signout() async {
    emit(const BlocState<Failure<ExceptionMessage>, UnitImpl>.loading());

    final _signoutEither = await _repository.signout();

    final _state = _signoutEither.fold(
      (failure) => BlocState<Failure<ExceptionMessage>, UnitImpl>.error(
          failure: failure),
      (_) => BlocState<Failure<ExceptionMessage>, UnitImpl>.success(data: _),
    );

    emit(_state);
  }
}
