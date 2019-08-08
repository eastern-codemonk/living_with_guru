import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:living_with_guru/domain/entities/user.dart';
import 'package:living_with_guru/domain/repositories/authentication_repositary.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:async';

/// A `UseCase` for registering a new `User` in the application
class RegisterUserCase extends CompletableUseCase<RegisterUserCaseParams> {

  // Members
  AuthenticationRepository _authenticationRepository;

  // Constructors
  RegisterUserCase(this._authenticationRepository);

  
  @override
  Future<Observable<User>> buildUseCaseObservable(RegisterUserCaseParams params) async {
    final StreamController<User> controller = StreamController();
    try {
      await _authenticationRepository.register(
        fullName: params._fullName, email: params._email, phone: params._phone, password: params._password);
      controller.close();
    } catch (e) {
      logger.severe('RegisterUseCase unsuccessful.', e);
      controller.addError(e);
    }
    return Observable(controller.stream);
  }
}

/// The parameters required for the [RegisterUseCase]
class RegisterUserCaseParams {
  String _fullName;
  String _email;
  String _phone;
  String _password;

  RegisterUserCaseParams(this._fullName, this._email, this._phone, this._password);
}
