import 'package:flutter/material.dart';
import 'package:polaris_suite_app/resources/colors/colors.dart';
import 'package:polaris_suite_app/utils/routes/routes.dart';
import 'package:polaris_suite_app/utils/routes/routes_name.dart';
import 'package:polaris_suite_app/view_model/auth_view_model.dart';
import 'package:polaris_suite_app/view_model/screens_viewmode.dart/details_viewmodel.dart';
import 'package:polaris_suite_app/view_model/screens_viewmode.dart/environment_viewmodel.dart';
import 'package:polaris_suite_app/view_model/screens_viewmode.dart/home_screen_viewmodel.dart';
import 'package:polaris_suite_app/view_model/screens_viewmode.dart/notification_viewmodel.dart';
import 'package:polaris_suite_app/view_model/screens_viewmode.dart/project_dropdown_viewmodel.dart';
import 'package:polaris_suite_app/view_model/screens_viewmode.dart/project_screen_viewmodel.dart';
import 'package:polaris_suite_app/view_model/screens_viewmode.dart/shortcuts_viewmodel.dart';
import 'package:polaris_suite_app/view_model/wrapper_screen_view_model.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: "assets/.env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => WrapperScreenViewProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProjectScreenViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => NotificationViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => HomeScreenViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => ShortcutsViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProjectProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => EnvironmentViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => DetailsViewModel(),
        ),
      ],
      child: MaterialApp(
        title: 'Polaris Suite',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: Colors.blue,
            fontFamily: 'QuickSand',
            iconTheme: const IconThemeData(
              color: AppColors.neutralDark,
            )),
        initialRoute: RoutesName.splash,
        onGenerateRoute: Routes.generateRoutes,
      ),
    );
  }
}
