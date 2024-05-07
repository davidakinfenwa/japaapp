// // ignore_for_file: no_leading_underscores_for_local_identifiers



// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:japaapp/business/blocs/bloc_state.dart';
// import 'package:japaapp/business/blocs/journey/intending_migrant_form_cubit.dart';
// import 'package:japaapp/business/snapshot_cache/journey_snapshot_cache.dart';
// import 'package:japaapp/core/dependence/dependence.dart';
// import 'package:japaapp/core/exceptions/exceptions.dart';
// import 'package:japaapp/domain/form_params/form_params.dart';
// import 'package:japaapp/domain/form_params/journey/task_form_params.dart';
// import 'package:japaapp/domain/model/journey/intending_migrant_model.dart';
// import 'package:japaapp/domain/model/models.dart';

// import 'package:japaapp/domain/repositories/journey_repository.dart';



// class TaskActionCubit extends Cubit<BlocState<Failure<ExceptionMessage>, TaskActionModel>> {
//   final JoruneyRepository _repository;
//   final JourneySnapshotCache _snapshotCache;

//   TaskActionCubit({
//     required JoruneyRepository repository,
//     required JourneySnapshotCache snapshotCache,
//   })  : _repository = repository,
//         _snapshotCache = snapshotCache,
//         super(const BlocState<Failure<ExceptionMessage>,
//             TaskActionModel>.initial());

//   Future<void> deleteTask({required DeleteTaskFormParams deleteTaskFormParams}) async {
//     emit(const BlocState<Failure<ExceptionMessage>, TaskActionModel>.loading());

//     final _deleteTaskEither = await _repository.deleteTask(deleteTaskFormParams: deleteTaskFormParams);

        

//     final _state = _deleteTaskEither.fold(
//       (failure) => BlocState<Failure<ExceptionMessage>, TaskActionModel>.error(
//           failure: failure),
//       (response) {
//         // cache snapshot
//          // _snapshotCache.intendingMigrantProcessModel = predictionInfoModel;
        
//         return BlocState<Failure<ExceptionMessage>, TaskActionModel>.success(data: response);
//       },
//     );

//     emit(_state);
//   }



//     Future<void> setDueDate({required SetDueDateFormParams setDueDateFormParams}) async {
//     emit(const BlocState<Failure<ExceptionMessage>, TaskActionModel>.loading());

//     final _setDueDateEither = await _repository.setDueDate(setDueDateFormParams: setDueDateFormParams);

//     final _state = _setDueDateEither.fold(
//       (failure) => BlocState<Failure<ExceptionMessage>, TaskActionModel>.error(
//           failure: failure),
//       (response) {
//         // cache snapshot
//          // _snapshotCache.intendingMigrantProcessModel = predictionInfoModel;
        
//         return BlocState<Failure<ExceptionMessage>, TaskActionModel>.success(data: response);
//       },
//     );

//     emit(_state);
//   }


//     Future<void> markTask({required MarkTaskDoneFormParams markTaskDoneFormParams}) async {
//     emit(const BlocState<Failure<ExceptionMessage>, TaskActionModel>.loading());

//     final _markTaskEither = await _repository.markAsDone(markTaskDoneFormParams: markTaskDoneFormParams);

//     final _state = _markTaskEither.fold(
//       (failure) => BlocState<Failure<ExceptionMessage>, TaskActionModel>.error(
//           failure: failure),
//       (response) {
//       //  print(response);
//         _snapshotCache.actionModel=response;
//         return BlocState<Failure<ExceptionMessage>, TaskActionModel>.success(data: response);

//       },
//     );

//     emit(_state);
   
    
//   }
// }
