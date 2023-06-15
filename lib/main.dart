import 'package:flutter/material.dart';
import 'package:polaris_suite_app/resources/colors/colors.dart';
import 'package:polaris_suite_app/utils/routes/routes.dart';
import 'package:polaris_suite_app/utils/routes/routes_name.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Polaris Suite',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: 'QuickSand',
          iconTheme: const IconThemeData(
            color: AppColors.neutralDark,
          )),
      initialRoute: RoutesName.signup,
      onGenerateRoute: Routes.generateRoutes,
    );
  }
}
