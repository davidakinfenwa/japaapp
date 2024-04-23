import 'package:get_it/get_it.dart';
import 'package:japaapp/business/blocs/account_bloc/create_budget_info_form_cubit.dart';
import 'package:japaapp/business/blocs/account_bloc/create_family_info_form_cubit.dart';
import 'package:japaapp/business/blocs/account_bloc/create_award_info_form_cubit.dart';
import 'package:japaapp/business/blocs/account_bloc/create_basic_info_form_cubit.dart';
import 'package:japaapp/business/blocs/account_bloc/create_education_info_form_cubit.dart';
import 'package:japaapp/business/blocs/account_bloc/create_work_info_form_cubit.dart';
import 'package:japaapp/business/blocs/account_bloc/get_all_user_data_form_cubit.dart';
import 'package:japaapp/business/blocs/account_bloc/get_user_drop_down_form_cubit.dart';
import 'package:japaapp/business/blocs/auth_blocs/email_otp_verification_form_cubit/email_otp_verification_form_cubit.dart';
import 'package:japaapp/business/blocs/auth_blocs/email_registration_form_cubit/email_registration_form_cubit.dart';
import 'package:japaapp/business/blocs/auth_blocs/resend_otp_code_form_cubit/resend_otp_code_form_cubit.dart';
import 'package:japaapp/business/blocs/auth_blocs/signin_form_cubit/signin_form_cubit.dart';
import 'package:japaapp/business/blocs/auth_blocs/signup_form_cubit/signup_form_cubit.dart';
import 'package:japaapp/business/blocs/journey/country_prediction_form_cubit.dart';
import 'package:japaapp/business/blocs/journey/visa_prediction_form_cubit.dart';
import 'package:japaapp/business/snapshot_cache/journey_snapshot_cache.dart';
import 'package:japaapp/business/snapshot_cache/snapshot_cache.dart';
import 'package:japaapp/core/network/network.dart';
import 'package:japaapp/data/remote_data/account_remote_data.dart';
import 'package:japaapp/data/remote_data/auth_remote_data.dart';
import 'package:japaapp/data/remote_data/journey_remote_data.dart';
import 'package:japaapp/data/repository_impl/account_repo_impl.dart';
import 'package:japaapp/data/repository_impl/auth_repo_impl.dart';
import 'package:japaapp/data/repository_impl/journey_repo_impl.dart';
import 'package:japaapp/domain/repositories/journey_repository.dart';
import 'package:japaapp/domain/repositories/repositories.dart';

void authDependenciesInit(GetIt getIt) {
  //CUBIT BLOC
  getIt.registerFactory<EmailRegistaionCubit>(() => EmailRegistaionCubit(repository: getIt(), snapshotCache: getIt()));
  getIt.registerFactory<EmailOtpVerificationFormCubit>(() => EmailOtpVerificationFormCubit( repository: getIt(), snapshotCache: getIt()));
  getIt.registerFactory<ResendOtpCodeFormCubit>(() => ResendOtpCodeFormCubit( repository: getIt()));
  getIt.registerFactory<SignupFormCubit>(() => SignupFormCubit( repository: getIt(), snapshotCache: getIt()));
  getIt.registerFactory<SigninFormCubit>(() => SigninFormCubit( repository: getIt(), snapshotCache: getIt()));
  getIt.registerFactory<GetAllUserDataFormCubit>(() => GetAllUserDataFormCubit( repository: getIt(), snapshotCache: getIt()));
  getIt.registerFactory<CreateBasicInformationCubit>(() => CreateBasicInformationCubit( repository: getIt(), snapshotCache: getIt()));
  getIt.registerFactory<GetUserDropdownFormCubit>(() => GetUserDropdownFormCubit( repository: getIt(), snapshotCache: getIt()));
  getIt.registerFactory<CreateEducationInformationCubit>(() => CreateEducationInformationCubit( repository: getIt(), snapshotCache: getIt()));
  getIt.registerFactory<CreateWorkInformationCubit>(() => CreateWorkInformationCubit( repository: getIt(), snapshotCache: getIt()));
  getIt.registerFactory<CreateFamilyInformationCubit>(() => CreateFamilyInformationCubit( repository: getIt(), snapshotCache: getIt()));
  getIt.registerFactory<CreateAwardfInformationCubit>(() => CreateAwardfInformationCubit( repository: getIt(), snapshotCache: getIt()));
  getIt.registerFactory<CountryPredictionCubit>(() => CountryPredictionCubit( repository: getIt(), snapshotCache: getIt()));
  getIt.registerFactory<VisaPredictionCubit>(() => VisaPredictionCubit( repository: getIt(), snapshotCache: getIt()));
  getIt.registerFactory<CreateBudgetInformationCubit>(() => CreateBudgetInformationCubit( repository: getIt(), snapshotCache: getIt()));



// Repository
  getIt.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(networkInfo: getIt(), remoteDataSource: getIt(),),);
  getIt.registerLazySingleton<AccountRepository>(() => AccountRepositoryImpl(networkInfo: getIt(), remoteDataSource: getIt(),),);
  getIt.registerLazySingleton<JoruneyRepository>(() => JourneyRepoImp(networkInfo: getIt(), remoteDataSource: getIt(),),);

//REMOTE DATA
  getIt.registerLazySingleton<AuthRemoteDataSource>(() => AuthRemoteDataSourceImpl(services: getIt()));
  getIt.registerLazySingleton<AccountRemoteDataSource>(() => AccountRemoteDataSourceImpl(services: getIt()));
  getIt.registerLazySingleton<JourneyRemoteDataSource>(() => JourneyRemoteDataSourceImpl(services: getIt()));

  getIt.registerLazySingleton<Services>(() => Services(exceptionMapper: getIt()));

  // snapshot caches
  getIt.registerLazySingleton<AuthSnapshotCache>(() => AuthSnapshotCache());
  getIt.registerLazySingleton<AccountSnapshotCache>(() => AccountSnapshotCache());
  getIt.registerLazySingleton<JourneySnapshotCache>(() => JourneySnapshotCache());
}
