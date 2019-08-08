import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:flutter/foundation.dart';
import 'package:living_with_guru/domain/repositories/authentication_repositary.dart';
import 'package:living_with_guru/domain/usecases/auth/register_usecase.dart';

class RegisterPresenter extends Presenter {

  AuthenticationRepository _authenticationRepository;
  RegisterUserCase _registerUserCase;

  Function registerOnComplete;
  Function registerOnError;

  RegisterPresenter(this._authenticationRepository) {
    _registerUserCase = RegisterUserCase(_authenticationRepository);
  }

  void dispose() {
    _registerUserCase.dispose();
  }

  void register({@required String fullName, @required String email,
   @required phone, @required String password}) {
    _registerUserCase.execute(_RegisterUserCaseObserver(this),
    RegisterUserCaseParams(fullName, email, phone, password));
  }
}
  
  class _RegisterUserCaseObserver implements Observer<void> {
    RegisterPresenter _registerPresenter;

    _RegisterUserCaseObserver(this._registerPresenter);

    void onNext(ignore) {}

    void onComplete() {
      _registerPresenter.registerOnComplete();
    }

    void onError(e) {
      if(_registerPresenter.registerOnError != null) {
        _registerPresenter.registerOnError(e);
      }
    }
}