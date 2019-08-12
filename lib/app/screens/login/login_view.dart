import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:living_with_guru/data/repositories/data_authentication_repository.dart';

import 'login_controller.dart';

class LoginPage extends View {
  LoginPage({Key key, this.title}) : super(key: key);

  final String title;

   @override
  _LoginPageView createState() =>
      _LoginPageView(LoginController(DataAuthenticationRepository()));
}

class _LoginPageView extends ViewState<LoginPage, LoginController> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  _LoginPageView(LoginController controller) : super(controller);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      alignment: Alignment.topLeft,
      child: ListView(
        children: [
          TextField(
              controller: controller.email,
              decoration: new InputDecoration(
                labelText: 'Email Address',
                hintText: 'abc@email.com'
                ),
          ),
          TextField(
              controller: controller.password,
              decoration: new InputDecoration(
                labelText: 'Password'
              ),
              obscureText: true,
            ),
            new RaisedButton(
              child: new Text('Login'),
              onPressed: () => controller.authenticate()
            ),
        ]
      )
    );
  }
  
}