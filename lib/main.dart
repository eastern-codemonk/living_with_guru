import 'package:flutter/material.dart';
import 'package:living_with_guru/app/screens/home/home_view.dart';
import 'package:living_with_guru/app/util/router.dart';
import 'package:living_with_guru/data/exceptions/authentication_exception.dart';
import 'package:logging/logging.dart';
import 'app/util/constants.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget
{
  final Router _router;
  
  MyApp() : _router = Router() {
    initLogger();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: UIConstants.appName,
      home: Scaffold(
        appBar: AppBar(
          title: Text(UIConstants.appName),
        ),
        body: Center(
          child: HomePage(
          ),
        ),
      ),
      onGenerateRoute: _router.getRoute,
      navigatorObservers: [_router.routeObserver],
    );
  }
  
  void initLogger() {
    Logger.root.level = Level.ALL;
    Logger.root.onRecord.listen((record) {
      dynamic e = record.error;
      String m = e is APIException ? e.message : e.toString();
      print(
          '${record.loggerName}: ${record.level.name}: ${record.message} ${m != 'null' ? m : ''}');
    });
    Logger.root.info("Logger initialized.");
  }
}