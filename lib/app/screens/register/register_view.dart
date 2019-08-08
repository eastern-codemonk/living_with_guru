import 'package:flutter/cupertino.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:living_with_guru/app/screens/register/register_controller.dart';
import 'package:living_with_guru/data/repositories/data_authentication_repository.dart';

class RegisterPage extends View {
  RegisterPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _RegisterPageView createState() =>
      _RegisterPageView(RegisterController(DataAuthenticationRepository()));
}

class _RegisterPageView extends ViewState<RegisterPage, RegisterController> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  _RegisterPageView(RegisterController controller) : super(controller);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      alignment: Alignment.topLeft,
      child: ListView(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 8, left: 8, bottom: 15),
                child: PlatformText(
                  'Pelase register here...',
                  textAlign: TextAlign.left,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: PlatformText('Full Name'),
              ),
              PlatformTextField(
                controller: controller.fullName,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: PlatformText('Email address'),
              ),
              PlatformTextField(
                controller: controller.email,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: PlatformText('Phone Number'),
              ),
              PlatformTextField(
                controller: controller.phone,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: PlatformText('Password'),
              ),
              PlatformTextField(
                controller: controller.password,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: PlatformButton(
                  onPressed: () => controller.register(),
                  child: Text('Register'),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
