
import 'dart:async';

import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:living_with_guru/domain/entities/user.dart';
import 'package:rxdart/rxdart.dart';
import 'package:logging/logging.dart';
import 'package:living_with_guru/domain/repositories/authentication_repositary.dart';

/// A `UseCase` for logging in a `User` into the application
class LoginUseCase extends CompletableUseCase<LoginUseCaseParams> {

  // Members
  AuthenticationRepository _authenticationRepository;
  Logger _logger;
  // Constructors
  LoginUseCase(this._authenticationRepository):super() { _logger = Logger('LoginUseCase'); }

  @override
  Future<Observable<User>> buildUseCaseObservable(LoginUseCaseParams params) async {
    final StreamController<User> controller = StreamController();
    try {
      await _authenticationRepository.authenticate(email: params._email, password: params._password);
      controller.close();
    } catch (e) {
      _logger.shout('Could not login the user.', e);
      controller.addError(e);
    }
    return Observable(controller.stream);
  }
}

/// The parameters required for the [LoginUseCase]
class LoginUseCaseParams {
  String _email;
  String _password;

  LoginUseCaseParams(this._email, this._password);
}
