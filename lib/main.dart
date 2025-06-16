import 'package:auvnet_internship_assessment/core/theme/app_theme.dart';
import 'package:auvnet_internship_assessment/features/startup/presentation/screens/startup_screen.dart';
import 'package:auvnet_internship_assessment/injection.dart';
import 'package:auvnet_internship_assessment/routes/routes_generator.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Hive.init((await getApplicationDocumentsDirectory()).path);
  await Hive.openBox('mybox');

  await setupInjection();

  runApp(NawelApp());
}

class NawelApp extends StatelessWidget {
  const NawelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StartupScreen(),
      onGenerateRoute: RouteGenerator.generateRoute,
      theme: AppTheme.lightTheme,
    );
  }
}
