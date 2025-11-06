import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/entity/auth_entity.dart';
import '../data_sources/check_forgot_password_code_remote_data_source.dart';
import '../data_sources/login_remote_data_source.dart';
import '../data_sources/logout_remote_data_source.dart';
import '../data_sources/register_remote_data_source.dart';
import '../data_sources/resend_verify_link_remote_data_source.dart';
import '../data_sources/reset_password_remote_data_source.dart';
import '../data_sources/send_forgot_password_link_remote_data_source.dart';
import '../data_sources/verify_email_remote_data_source.dart';
import 'auth_repo.dart';

class AuthRepositoryImpl extends AuthRepository {
  final LoginRemoteDataSource _loginDataSource;
  final RegisterRemoteDataSource _registerDataSource;
  final ResetPasswordRemoteDataSource _forgotPasswordDataSource;
  final LogoutRemoteDataSource _logoutDataSource;
  final ResendVerifyLinkRemoteDataSource _resendVerifyLinkDataSource;
  final VerifyEmailRemoteDataSource _verifyEmailDataSource;
  final CheckForgotPasswordCodeRemoteDataSource
  _checkForgotPasswordCodeDataSource;
  final SendForgotPasswordLinkRemoteDataSource
  _sendForgotPasswordLinkDataSource;

  AuthRepositoryImpl(
    this._loginDataSource,
    this._registerDataSource,
    this._forgotPasswordDataSource,
    this._logoutDataSource,
    this._resendVerifyLinkDataSource,
    this._verifyEmailDataSource,
    this._checkForgotPasswordCodeDataSource,
    this._sendForgotPasswordLinkDataSource,
  );

  @override
  Future<Either<Failure, AuthEntity>> login({
    required String email,
    required String password,
  }) async {
    final result = await _loginDataSource.login(
      email: email,
      password: password,
    );
    return result.fold(
      (failure) => Left(failure),
      (model) => Right(model.toEntity()),
    );
  }

  @override
  Future<Either<Failure, AuthEntity>> register({
    required String name,
    required String email,
    required String password,
    required String passwordConfirmation,
  }) async {
    final result = await _registerDataSource.register(
      name: name,
      email: email,
      password: password,
      passwordConfirmation: passwordConfirmation,
    );
    return result.fold(
      (failure) => Left(failure),
      (model) => Right(model.toEntity()),
    );
  }

  @override
  Future<Either<Failure, void>> resetPassword({
    required String code,
    required String password,
    required String passwordConfirmation,
  }) async {
    final result = await _forgotPasswordDataSource.resetPassword(
      code: code,
      password: password,
      passwordConfirmation: passwordConfirmation,
    );
    return result.fold((failure) => Left(failure), (model) => Right(model));
  }

  @override
  Future<Either<Failure, void>> logout() {
    return _logoutDataSource.logout();
  }

  @override
  Future<Either<Failure, void>> checkForgotPasswordCode({
    required String verifyCode,
  }) async {
    final result = await _checkForgotPasswordCodeDataSource
        .checkForgotPasswordCode(verifyCode: verifyCode);
    return result.fold((failure) => Left(failure), (model) => Right(model));
  }

  @override
  Future<Either<Failure, void>> resendVerifyLink() async {
    final result = await _resendVerifyLinkDataSource.resendVerifyLink();
    return result.fold((failure) => Left(failure), (model) => Right(model));
  }

  @override
  Future<Either<Failure, void>> sendForgotPasswordLink({
    required String email,
  }) async {
    final result = await _sendForgotPasswordLinkDataSource
        .sendForgotPasswordLink(email: email);
    return result.fold((failure) => Left(failure), (model) => Right(model));
  }

  @override
  Future<Either<Failure, void>> verifyEmail({
    required String verifyCode,
  }) async {
    final result = await _verifyEmailDataSource.verifyEmail(
      verifyCode: verifyCode,
    );
    return result.fold((failure) => Left(failure), (model) => Right(model));
  }
}
