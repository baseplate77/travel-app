import 'package:flutter/material.dart';

import 'core/size_config.dart';
import 'screens/splash_screen/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        SizeConfig.init(
          screenSize: Size(constraints.maxWidth, constraints.maxHeight),
          orientation: orientation,
        );

        return MaterialApp(
          title: 'App',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(fontFamily: 'CircularStd'),
          home: const SplashScreen(),
        );
      });
    });
  }
}
