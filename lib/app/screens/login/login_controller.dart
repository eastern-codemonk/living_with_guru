import 'package:flutter/widgets.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:living_with_guru/app/screens/login/login_presenter.dart';
import 'package:living_with_guru/app/util/constants.dart';
import 'package:living_with_guru/app/widgets/generic_snackbar.dart';

class LoginController extends Controller {
  TextEditingController email;
  TextEditingController password;

  LoginPresenter _loginPresenter;

  LoginController(authRepo) : _loginPresenter = LoginPresenter(authRepo) {
    email = TextEditingController();
    password = TextEditingController();
  }

  @override
  void initListeners() {

    _loginPresenter.loginOnComplete = () {
      logger.finest("Complete: Login success.");
      showGenericSnackbar(getStateKey(), Strings.loginSuccess);
      Navigator.of(getContext()).pop();
    };

    _loginPresenter.loginOnError = () {
      logger.finest("Complete: Login failed.");
      showGenericSnackbar(getStateKey(), Strings.loginFailed, isError: true);
    };
  }

  void authenticate() {
    _loginPresenter.login(
      email: email.text, password: password.text
    );
  }

  @override
  void dispose() {
    _loginPresenter.dispose();
    super.dispose();
  }
}
