import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import 'app/screens/register/register_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget
{
  //final Router _router;
  
  @override
  Widget build(BuildContext context) {
    return PlatformApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Welcome to Flutter'),
        ),
        body: Center(
          child: RegisterPage(
            
          ),
        ),
      ),
    );
  }
  
}