import 'package:dartz/dartz.dart';
import 'package:japaapp/core/constants.dart';
import 'package:japaapp/core/util/unit_impl.dart';
import 'package:japaapp/data/datasources/datasources.dart';
import 'package:japaapp/domain/form_params/form_params.dart';
import 'package:japaapp/domain/repositories/repositories.dart';



import '../../core/exceptions/exceptions.dart';
import '../../core/network/network.dart';
import '../../domain/model/models.dart';

class AuthRepositoryImpl implements AuthRepository {
  final NetworkInfo _networkInfo;
  final AuthLocalDataSource _localDataSource;
  final AuthRemoteDataSource _remoteDataSource;

  AuthRepositoryImpl({
    required NetworkInfo networkInfo,
    required AuthLocalDataSource localDataSource,
    required AuthRemoteDataSource remoteDataSource,
  })  : _networkInfo = networkInfo,
        _localDataSource = localDataSource,
        _remoteDataSource = remoteDataSource;

  Future<Either<Failure<ExceptionMessage>, AuthKeyModel>>
      _getAuthKeyFromLocalDataSource() async {
    try {
      final _authKey = await _localDataSource.getAuthKey();
      return right(_authKey);
    } on ExceptionType<ExceptionMessage> catch (e) {
      return left(Failure.serverFailure(exception: e));
    }
  }

  Future<Either<Failure<ExceptionMessage>, UserInfoModel>>
      _getUserInfoFromLocalDataSource() async {
    try {
      final _userInfoModel = await _localDataSource.getUserInfo();
      return right(_userInfoModel);
    } on ExceptionType<ExceptionMessage> catch (e) {
      return left(Failure.serverFailure(exception: e));
    }
  }

  Future<Either<Failure<ExceptionMessage>, UserInfoModel>>
      _getUserProfileFromLocalDataSource() async {
    try {
      final _userProfileModel = await _localDataSource.getUserProfile();
      return right(_userProfileModel);
    } on ExceptionType<ExceptionMessage> catch (e) {
      return left(Failure.serverFailure(exception: e));
    }
  }

  @override
  Future<Either<Failure<ExceptionMessage>, UserInfoModel>>
      getAuthenticatedUser() => _getUserProfileFromLocalDataSource();

  @override
  Future<Either<Failure<ExceptionMessage>, UserInfoModel>> signup(
      {required SignUpFromParams signUpFromParams}) async {
    if ((await _networkInfo.isConnected)) {
      try {
        final _userInfoModel =
            await _remoteDataSource.signup(signUpFromParams: signUpFromParams);

        // cache user-info
        if (_userInfoModel.hasUserInfo) {
          await _localDataSource.cacheUserInfo(_userInfoModel);
        }

        return right(_userInfoModel);
      } on ExceptionType<ExceptionMessage> catch (e) {
        return left(Failure.serverFailure(exception: e));
      }
    }

    return left(const Failure.serverFailure(
        exception: ExceptionMessages.NO_INTERNET_CONNECTION));
  }

  @override
  Future<Either<Failure<ExceptionMessage>, UserInfoModel>> signin(
      {required SignInFromParams signInFromParams}) async {
    if ((await _networkInfo.isConnected)) {
      try {
        final _userInfoModel =
            await _remoteDataSource.signin(signInFromParams: signInFromParams);

        // cache user-info
        if (_userInfoModel.hasUserInfo) {
          await _localDataSource.cacheUserInfo(_userInfoModel);
        }

        return right(_userInfoModel);
      } on ExceptionType<ExceptionMessage> catch (e) {
        return left(Failure.serverFailure(exception: e));
      }
    }

    return left(const Failure.serverFailure(
        exception: ExceptionMessages.NO_INTERNET_CONNECTION));
  }

  @override
  Future<Either<Failure<ExceptionMessage>, UserInfoModel>>
      getUserProfile() async {
    if ((await _networkInfo.isConnected)) {
      try {
        // get user-info from storage and extract uid to fetch user-profile
        final _userInfoEither = await _getUserInfoFromLocalDataSource();

        return _userInfoEither.fold(
          (failure) => left(failure),
          (userInfoModel) async {

            //TODO: FIX THE return value to the UserProfileFormParams coming from the user model(Reference to MSMPUSER)
            final _userProfileFormParams =
                UserProfileFormParams(userId: 1.toString());

            final _userProfile = await _remoteDataSource.getUserProfile(
                userProfileFormParams: _userProfileFormParams);

            // cache user-profile
            await _localDataSource.cacheUserProfile(_userProfile);

            return right(_userProfile);
          },
        );
      } on ExceptionType<ExceptionMessage> catch (e) {
        return left(Failure.serverFailure(exception: e));
      }
    }

    return left(const Failure.serverFailure(
        exception: ExceptionMessages.NO_INTERNET_CONNECTION));
  }

  @override
  Future<Either<Failure<ExceptionMessage>, ResponseModel<AuthKeyModel>>>
      forgotPassword(
          {required ForgotPasswordFormParams forgotPasswordFormParams}) async {
    if ((await _networkInfo.isConnected)) {
      try {
        final _responseModel = await _remoteDataSource.forgotPassword(
            forgotPasswordFormParams: forgotPasswordFormParams);

        // cache user-info
        if (_responseModel is SuccessResponse<AuthKeyModel>) {
          final _authKey = _responseModel.maybeMap(
            orElse: () => AuthKeyModel.empty(),
            successResponse: (state) => state.data,
          );

          await _localDataSource.cacheAuthKey(_authKey);
        }

        return right(_responseModel);
      } on ExceptionType<ExceptionMessage> catch (e) {
        return left(Failure.serverFailure(exception: e));
      }
    }

    return left(const Failure.serverFailure(
        exception: ExceptionMessages.NO_INTERNET_CONNECTION));
  }

  @override
  Future<Either<Failure<ExceptionMessage>, GenericResponseModel>>
      verifyPasswordResetOTPCode(
          {required ForgotPasswordOtpVerificationFormParams
              forgotPasswordOtpVerificationFormParams}) async {
    if ((await _networkInfo.isConnected)) {
      try {
        // get auth-key from storage and add to form params
        final _authKeyEither = await _getAuthKeyFromLocalDataSource();

        return _authKeyEither.fold(
          (failure) => left(failure),
          (authKeyModel) async {
            final _result = await _remoteDataSource.verifyPasswordResetOTPCode(
              authKeyModel: authKeyModel,
              forgotPasswordOtpVerificationFormParams:
                  forgotPasswordOtpVerificationFormParams,
            );

            return right(_result);
          },
        );
      } on ExceptionType<ExceptionMessage> catch (e) {
        return left(Failure.serverFailure(exception: e));
      }
    }

    return left(const Failure.serverFailure(
        exception: ExceptionMessages.NO_INTERNET_CONNECTION));
  }

  @override
  Future<Either<Failure<ExceptionMessage>, GenericResponseModel>>
      changePassword(
          {required ChangePasswordFormParams changePasswordFormParams}) async {
    if ((await _networkInfo.isConnected)) {
      try {
        // get auth-key from storage and add to form params
        final _authKeyEither = await _getAuthKeyFromLocalDataSource();

        return _authKeyEither.fold(
          (failure) => left(failure),
          (authKeyModel) async {
            final _result = await _remoteDataSource.changePassword(
              authKeyModel: authKeyModel,
              changePasswordFormParams: changePasswordFormParams,
            );

            return right(_result);
          },
        );
      } on ExceptionType<ExceptionMessage> catch (e) {
        return left(Failure.serverFailure(exception: e));
      }
    }

    return left(const Failure.serverFailure(
        exception: ExceptionMessages.NO_INTERNET_CONNECTION));
  }

  @override
  Future<Either<Failure<ExceptionMessage>, ResponseModel<GenericResponseModel>>>
      verifySignupOTPCode({
    required SignupOtpVerificationFormParams signupOtpVerificationFormParams,
  }) async {
    if ((await _networkInfo.isConnected)) {
      try {
        // get user-info from storage to get uid
        final _userInfoEither = await _getUserInfoFromLocalDataSource();

        return _userInfoEither.fold(
          (failure) => left(failure),
          (_) async {
            final _responseModel = await _remoteDataSource.verifySignupOTPCode(
              signupOtpVerificationFormParams: signupOtpVerificationFormParams,
            );

            return right(_responseModel);
          },
        );
      } on ExceptionType<ExceptionMessage> catch (e) {
        return left(Failure.serverFailure(exception: e));
      }
    }

    return left(const Failure.serverFailure(
        exception: ExceptionMessages.NO_INTERNET_CONNECTION));
  }

  @override
  Future<Either<Failure<ExceptionMessage>, GenericResponseModel>>
      resendOTPVerificationCode(
          {required ResendOtpFormParams resendOtpFormParams}) async {
    if ((await _networkInfo.isConnected)) {
      try {
        final _result = await _remoteDataSource.resendOTPVerificationCode(
            resendOtpFormParams: resendOtpFormParams);

        return right(_result);
      } on ExceptionType<ExceptionMessage> catch (e) {
        return left(Failure.serverFailure(exception: e));
      }
    }

    return left(const Failure.serverFailure(
        exception: ExceptionMessages.NO_INTERNET_CONNECTION));
  }

  @override
  Future<Either<Failure<ExceptionMessage>, UnitImpl>> signout() async {
    try {
      await _localDataSource.clearAppPreference();

      return right(unitImpl);
    } on ExceptionType<ExceptionMessage> catch (e) {
      return left(Failure.serverFailure(exception: e));
    }
  }
}
