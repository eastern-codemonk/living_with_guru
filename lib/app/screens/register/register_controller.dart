import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:flutter/material.dart';
import 'package:living_with_guru/app/screens/register/register_presenter.dart';
import 'package:living_with_guru/app/util/constants.dart';
import 'package:living_with_guru/app/widgets/generic_snackbar.dart';

class RegisterController extends Controller {
  TextEditingController fullName;
  TextEditingController email;
  TextEditingController phone;
  TextEditingController password;
  TextEditingController confirmedPassword;

  bool agreedToTOS;
  RegisterPresenter _registerPresenter;

  RegisterController(authRepo)
      : _registerPresenter = RegisterPresenter(authRepo) {
    fullName = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
    confirmedPassword = TextEditingController();
    agreedToTOS = false;

    initListeners();
  }

  void initListeners() {
    _registerPresenter.registerOnComplete = () {
      logger.finest("Complete: Registration success.");
      showGenericSnackbar(getStateKey(), Strings.registrationSuccessful);
      Navigator.of(getContext()).pop();
    };

    _registerPresenter.registerOnError = (e) {
      showGenericSnackbar(getStateKey(), e.message, isError: true);
    };
  }

  void register() {
    _registerPresenter.register(
        fullName: fullName.text,
        email: email.text,
        phone: phone.text,
        password: password.text);
  }

  void setAgreedToTOS() {
    agreedToTOS = !agreedToTOS;
  }

  void checkForm(Map<String, dynamic> params) {
    dynamic formKey = params['formKey'];

    // Validate params
    assert(formKey is GlobalKey<FormState>);

    if (formKey.currentState.validate()) {
      if (agreedToTOS) {
        register();
      } else {
        showGenericSnackbar(getStateKey(), Strings.tosNotAccepted,
            isError: true);
      }
    } else {
      logger.shout('Registration failed');
      showGenericSnackbar(getStateKey(), Strings.registrationFormIncomplete,
          isError: true);
    }
  }

  @override
  void dispose() {
    _registerPresenter.dispose();
    super.dispose();
  }
}
