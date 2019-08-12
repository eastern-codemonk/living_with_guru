
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:living_with_guru/data/repositories/data_authentication_repository.dart';

import 'home_controller.dart';

class HomePage extends View {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  HomePageView createState() => HomePageView(HomeController(DataAuthenticationRepository()));
}

class HomePageView extends ViewState<HomePage, HomeController> {

  HomePageView(HomeController controller) : super(controller);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Welcome!!!'),
    );
  }

}